import '../utils/utils.dart';
import 'models.dart';

final class SleepWeekSummary with HasSleepDuration {
  const SleepWeekSummary({
    required this.year,
    required this.week,
    required this.totalSleepSeconds,
  });

  final int year;
  final int week;
  @override
  final int totalSleepSeconds;

  Duration get averageSleepPerDay => Duration(seconds: totalSleepSeconds ~/ 7);

  String get averageSleepFormatted =>
      formatDurationFromSeconds(averageSleepPerDay.inSeconds);
}
