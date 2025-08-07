import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'models.dart';

final class WeekSleepLogsDetail with HasSleepDuration {
  const WeekSleepLogsDetail({
    required this.week,
    required this.year,
    required this.logs,
  });

  final int week;
  final int year;
  final List<SleepLog> logs;

  @override
  int get totalSleepSeconds =>
      logs.fold(0, (sum, log) => sum + log.duration.inSeconds);

  int get loggedDays =>
      logs.map((e) => DateUtils.dateOnly(e.wokeUpAt)).toSet().length;

  Duration get averageSleepPerLoggedDay => loggedDays > 0
      ? Duration(seconds: totalSleepSeconds ~/ loggedDays)
      : Duration.zero;

  String get averageSleepFormatted =>
      formatDurationFromSeconds(averageSleepPerLoggedDay.inSeconds);
}
