import 'models.dart';

final class YearlySleepSummary with HasSleepDuration {
  const YearlySleepSummary({
    required this.weeklySummaries,
    required this.totalCount,
  });

  final List<SleepWeekSummary> weeklySummaries;
  final int totalCount;

  @override
  int get totalSleepSeconds =>
      weeklySummaries.fold(0, (sum, log) => sum + log.totalSleepSeconds);
}
