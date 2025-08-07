import '../../domain/domain.dart';

final class TimeLog {
  const TimeLog({
    required this.startDate,
    required this.endDate,
    required this.logType,
  });

  final DateTime startDate;
  final DateTime? endDate;
  final LogType logType;

  Duration get duration =>
      endDate != null ? endDate!.difference(startDate) : Duration.zero;
}
