import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/token.dart';
import 'package:analyzer/dart/ast/visitor.dart';

import '../models/code_issue.dart';
import '../models/code_issue_severity.dart';
import '../models/source.dart';
import 'base_rule.dart';
import 'rule_utils.dart';

const _one = 1;

class V3154Rule extends BaseRule {
  static const String ruleId = 'v3154';
  static const _documentationUrl = '';

  static const _alwaysZero = 'Результат выражения всегда равено нулю.';

  V3154Rule({Map<String, Object> config = const {}})
      : super(
            id: ruleId,
            documentation: Uri.parse(_documentationUrl),
            severity:
                CodeIssueSeverity.fromJson(config['severity'] as String) ??
                    CodeIssueSeverity.warning);

  @override
  Iterable<CodeIssue> check(Source source) {
    final _visitor = _Visitor();

    source.compilationUnit.visitChildren(_visitor);

    return _visitor.expressions
        .map((e) => createIssue(this, _alwaysZero, null, null, source.url,
            source.content, source.compilationUnit.lineInfo, e))
        .toList();
  }
}

class _Visitor extends RecursiveAstVisitor<Object> {
  final _expressions = <BinaryExpression>[];

  Iterable<BinaryExpression> get expressions => _expressions;

  @override
  void visitBinaryExpression(BinaryExpression node) {
    super.visitBinaryExpression(node);

    if (node.operator.type == TokenType.PERCENT) {
      final rightOperand = node.rightOperand;
      if (rightOperand is IntegerLiteral && rightOperand.value.abs() == _one) {
        _expressions.add(node);
      } else if (rightOperand is DoubleLiteral &&
          rightOperand.value.toInt().abs() == _one) {
        _expressions.add(node);
      } else if (rightOperand is SimpleIdentifier) {
        _expressions.add(node);
      }
    }
  }
}
