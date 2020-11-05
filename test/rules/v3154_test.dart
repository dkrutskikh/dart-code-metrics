@TestOn('vm')
import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:dart_code_metrics/src/models/code_issue_severity.dart';
import 'package:dart_code_metrics/src/models/source.dart';
import 'package:dart_code_metrics/src/rules/v3154.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

const _content = '''

void main() {
  const one = 1;
  const oneAndHalf = 1.5;

  const x = 100;
  
  if ((x % 1.9) == 1) {}
  if ((x % 1) == 1) {}

  if ((x % oneAndHalf) == 1) {}
  if ((x % one) == 1) {}
}

''';

void main() {
  test('V3154Rule reports about found issues', () async {
    final sourceUrl = Uri.parse('/example.dart');

    final parseResult = parseString(
        content: _content,
        featureSet: FeatureSet.fromEnableFlags([]),
        throwIfDiagnostics: false);

    final issues = V3154Rule()
        .check(Source(sourceUrl, parseResult.content, parseResult.unit));

//    final path = p.normalize(p.absolute('test/rules/v3154/example.dart'));

//    final sourceUrl = Uri.parse(path);
//    final parseResult = await resolveFile(path: path);

//    final issues = V3154Rule()
//        .check(Source(sourceUrl, parseResult.content, parseResult.unit));

    expect(issues.length, equals(2));

    expect(issues.every((issue) => issue.ruleId == 'v3154'), isTrue);
    expect(issues.every((issue) => issue.severity == CodeIssueSeverity.warning),
        isTrue);
    expect(issues.every((issue) => issue.sourceSpan.sourceUrl == sourceUrl),
        isTrue);
    expect(
        issues.map((issue) => issue.sourceSpan.start.offset), equals([42, 67]));
    expect(issues.map((issue) => issue.sourceSpan.start.line), equals([5, 6]));
    expect(
        issues.map((issue) => issue.sourceSpan.start.column), equals([8, 8]));
    expect(
        issues.map((issue) => issue.sourceSpan.end.offset), equals([49, 72]));
    expect(issues.map((issue) => issue.sourceSpan.text),
        equals(['x % 1.9', 'x % 1']));
    expect(
        issues.every((issue) =>
            issue.message == 'Результат выражения всегда равено нулю.'),
        isTrue);
    expect(issues.every((issue) => issue.correction == null), isTrue);
    expect(issues.every((issue) => issue.correctionComment == null), isTrue);
  });
}
