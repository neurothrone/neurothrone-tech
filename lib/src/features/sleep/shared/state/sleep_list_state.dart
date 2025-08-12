import '../data/models/models.dart';

final class SleepListState {
  const SleepListState({
    required this.logs,
  });

  factory SleepListState.initial() => const SleepListState(
    logs: [],
  );

  final List<SleepLog> logs;
}
