import '../utils/utils.dart';

mixin HasSleepDuration {
  int get totalSleepSeconds;

  String get totalDurationFormatted =>
      formatDurationFromSeconds(totalSleepSeconds);
}
