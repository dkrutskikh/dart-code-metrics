@TestOn('vm')
import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:dart_code_metrics/src/metrics/nesting_level/nesting_level_visitor.dart';
import 'package:test/test.dart';

const _simpleFunction = '''
int _simpleFunction(double index) {
  if (index < 10) {
    return 10;
  } else if (index < 20) {
    return 20;
  } else if (index < 40) {
    if (index < 30) {
      return 30;
    }

    return 40;
  }

  return 100;
}
''';

class ScopeAstVisitor extends SimpleAstVisitor<Object> {
  List<Declaration> functions = <Declaration>[];

  @override
  void visitFunctionDeclaration(FunctionDeclaration node) {
    functions.add(node);
    super.visitFunctionDeclaration(node);
  }
}

void main() {
  test('NestingLevelVisitor collect information about nesting levels', () {
    final parseResult = parseString(
      content: _simpleFunction,
      featureSet: FeatureSet.fromEnableFlags([]),
      throwIfDiagnostics: false,
    );

    final visitor = ScopeAstVisitor();
    parseResult.unit.visitChildren(visitor);

    final nestingLevelVisitor =
        NestingLevelVisitor(visitor.functions.first, parseResult.lineInfo);
    visitor.functions.first.visitChildren(nestingLevelVisitor);

    expect(
        nestingLevelVisitor.nestingLines,
        equals([
          [1],
          [2, 1],
          [4, 1],
          [6, 1],
          [7, 6, 1],
        ]));
  });
}
