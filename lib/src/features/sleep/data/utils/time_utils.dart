String formatDurationFromSeconds(int seconds) {
  final hours = seconds ~/ 3600;
  final minutes = (seconds % 3600) ~/ 60;
  return "$hours h ${minutes.toString().padLeft(2, '0')} min";
}
