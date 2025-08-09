import '../../../shared/data/models/models.dart';

final class SleepHistoryState {
  const SleepHistoryState({
    required this.summary,
  });

  factory SleepHistoryState.initial() => const SleepHistoryState(
    summary: null,
  );

  final YearlySleepSummary? summary;
}
