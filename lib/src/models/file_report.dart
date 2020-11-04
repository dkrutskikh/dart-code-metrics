import 'package:meta/meta.dart';

@immutable
class FileReport {
  final int averageArgumentsCount;
  final int totalArgumentsCountViolations;

  final double averageMaintainabilityIndex;
  final int totalMaintainabilityIndexViolations;

  final int averageMethodsCount;
  final int totalMethodsCountViolations;

  final int totalCyclomaticComplexity;
  final int totalCyclomaticComplexityViolations;

  final int totalLinesOfExecutableCode;
  final int totalLinesOfExecutableCodeViolations;

  const FileReport(
      {@required this.averageArgumentsCount,
      @required this.totalArgumentsCountViolations,
      @required this.averageMaintainabilityIndex,
      @required this.totalMaintainabilityIndexViolations,
      @required this.averageMethodsCount,
      @required this.totalMethodsCountViolations,
      @required this.totalCyclomaticComplexity,
      @required this.totalCyclomaticComplexityViolations,
      @required this.totalLinesOfExecutableCode,
      @required this.totalLinesOfExecutableCodeViolations});

  FileReport.merge(FileReport lhs, FileReport rhs)
      : averageArgumentsCount =
            ((lhs.averageArgumentsCount + rhs.averageArgumentsCount) / 2)
                .round(),
        totalArgumentsCountViolations = lhs.totalArgumentsCountViolations +
            rhs.totalArgumentsCountViolations,
        averageMaintainabilityIndex = (lhs.averageMaintainabilityIndex +
                rhs.averageMaintainabilityIndex) /
            2,
        totalMaintainabilityIndexViolations =
            lhs.totalMaintainabilityIndexViolations +
                rhs.totalMaintainabilityIndexViolations,
        averageMethodsCount =
            ((lhs.averageMethodsCount + rhs.averageMethodsCount) / 2).round(),
        totalMethodsCountViolations =
            lhs.totalMethodsCountViolations + rhs.totalMethodsCountViolations,
        totalCyclomaticComplexity =
            lhs.totalCyclomaticComplexity + rhs.totalCyclomaticComplexity,
        totalCyclomaticComplexityViolations =
            lhs.totalCyclomaticComplexityViolations +
                rhs.totalCyclomaticComplexityViolations,
        totalLinesOfExecutableCode =
            lhs.totalLinesOfExecutableCode + rhs.totalLinesOfExecutableCode,
        totalLinesOfExecutableCodeViolations =
            lhs.totalLinesOfExecutableCodeViolations +
                rhs.totalLinesOfExecutableCodeViolations;
}
