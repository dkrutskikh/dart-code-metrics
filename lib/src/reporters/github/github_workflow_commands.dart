import 'dart:io';

import 'package:source_span/source_span.dart';

// https://docs.github.com/en/actions/reference/workflow-commands-for-github-actions#setting-a-warning-message

class GitHubWorkflowCommands {
  void warning(String message, {SourceSpanBase sourceSpan}) {
    _echo(
        'warning',
        message,
        _params(sourceSpan?.sourceUrl?.toFilePath(), sourceSpan?.start?.line,
            sourceSpan?.start?.column));
  }

  void error(String message, {SourceSpanBase sourceSpan}) {
    _echo(
        'error',
        message,
        _params(sourceSpan?.sourceUrl?.toFilePath(), sourceSpan?.start?.line,
            sourceSpan?.start?.column));
  }

  void _echo(String command, [String message, Map<String, Object> parameters]) {
    final sb = StringBuffer('::$command');
    final params = parameters?.entries
        ?.map((e) => '${e.key}=${e.value}')
        ?.join(',')
        ?.trim();
    if (params != null && params.isNotEmpty) {
      sb.write(' $params');
    }
    sb.write('::');
    if (message != null) {
      sb.write(message);
    }
    stdout.writeln(sb.toString());
  }

  Map<String, Object> _params(String file, int line, int column) => {
        if (file != null) 'file': file,
        if (line != null) 'line': line,
        if (column != null) 'col': column,
      };
}
