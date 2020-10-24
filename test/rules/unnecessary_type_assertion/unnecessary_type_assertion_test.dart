@TestOn('vm')

import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:dart_code_metrics/src/models/code_issue_severity.dart';
import 'package:dart_code_metrics/src/models/source.dart';
import 'package:dart_code_metrics/src/rules/unnecessary_type_assertion.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

void main() {
  test('UnnecessaryTypeAssertionRule reports about found issues', () async {
    final path =
        p.absolute('test/rules/unnecessary_type_assertion/example.dart');

    final sourceUrl = Uri.parse(path);
    final parseResult = await resolveFile(path: path);

    final issues = UnnecessaryTypeAssertionRule()
        .check(Source(sourceUrl, parseResult.content, parseResult.unit));

    expect(issues.length, equals(3));

    expect(issues.every((issue) => issue.ruleId == 'newline-before-return'),
        isTrue);
    expect(issues.every((issue) => issue.severity == CodeIssueSeverity.style),
        isTrue);
    expect(issues.every((issue) => issue.sourceSpan.sourceUrl == sourceUrl),
        isTrue);
    expect(issues.map((issue) => issue.sourceSpan.start.offset),
        equals([178, 899, 1061]));
    expect(issues.map((issue) => issue.sourceSpan.start.line),
        equals([13, 58, 70]));
    expect(issues.map((issue) => issue.sourceSpan.start.column),
        equals([5, 5, 5]));
    expect(issues.map((issue) => issue.sourceSpan.end.offset),
        equals([191, 912, 1074]));
    expect(issues.map((issue) => issue.sourceSpan.text),
        equals(['return a + 1;', 'return a + 2;', 'return a + 2;']));
    expect(
        issues.map((issue) => issue.message),
        equals([
          'Missing blank line before return',
          'Missing blank line before return',
          'Missing blank line before return',
        ]));
    expect(issues.map((issue) => issue.correction), equals([null, null, null]));
    expect(issues.map((issue) => issue.correctionComment),
        equals([null, null, null]));
  });
}
