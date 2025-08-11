import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

extension DateTimeUtils on DateTime {
  int weekNumber() {
    final firstDayOfYear = DateTime(year, 1, 1);
    final daysSinceYearStart = difference(firstDayOfYear).inDays;
    return ((daysSinceYearStart + firstDayOfYear.weekday) / 7).ceil();
  }
}

extension DateTimeFormattingX on DateTime {
  String weekdayWithTimeLabel() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final thatDay = DateTime(year, month, day);
    final diffDays = thatDay.difference(today).inDays;

    // Example: Today • 06:40
    final dayDescriptor = switch (diffDays) {
      0 => "Today",
      -1 => "Yesterday",
      _ => DateFormat.EEEE().format(this),
    };
    return "$dayDescriptor • ${DateFormat.Hm().format(this)}";
  }

  String dayNumber() => DateFormat.d().format(this);

  String monthAbbr() => DateFormat.MMM().format(this);
}

String formatIsoWeekRange({required int year, required int week}) {
  DateTime start = isoWeekStart(year, week);
  final end = start.add(const Duration(days: 6));

  final sameMonth = start.month == end.month;
  if (sameMonth) {
    // e.g., Aug 4–10
    final month = DateFormat.MMM().format(start);
    return "$month ${start.day}–${end.day}";
  } else {
    // e.g., Jul 29–Aug 4
    final startMonth = DateFormat.MMM().format(start);
    final endMonth = DateFormat.MMM().format(end);
    return "$startMonth ${start.day}–$endMonth ${end.day}";
  }
}

DateTime isoWeekStart(int year, int week) {
  // ISO week 1 is the week with Jan 4; weeks start on Monday.
  final jan4 = DateTime(year, 1, 4);
  final weekday = jan4.weekday; // Monday=1...Sunday=7
  final mondayOfWeek1 = jan4.subtract(
    Duration(days: weekday - DateTime.monday),
  );
  final start = mondayOfWeek1.add(Duration(days: (week - 1) * 7));
  return DateTime(start.year, start.month, start.day);
}

// Helper to build a DateTime at a specific time on a specific day
DateTime atTime(DateTime day, int minutesFromMidnight) {
  final d = DateUtils.dateOnly(day);
  final h = minutesFromMidnight ~/ 60;
  final m = minutesFromMidnight % 60;
  return DateTime(d.year, d.month, d.day, h, m);
}
