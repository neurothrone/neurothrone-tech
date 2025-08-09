import 'package:intl/intl.dart';

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
