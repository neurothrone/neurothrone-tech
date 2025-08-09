extension DurationFormattingX on Duration {
  String toHoursMinutes() {
    final h = inHours;
    final m = inMinutes.remainder(60);
    return "${h}h ${m}m";
  }
}
