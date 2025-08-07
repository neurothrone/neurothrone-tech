final class SleepLog {
  const SleepLog({
    required this.wokeUpAt,
    required this.fellAsleepAt,
  });

  final DateTime wokeUpAt;
  final DateTime? fellAsleepAt;

  Duration get duration =>
      fellAsleepAt != null ? wokeUpAt.difference(fellAsleepAt!) : Duration.zero;
}
