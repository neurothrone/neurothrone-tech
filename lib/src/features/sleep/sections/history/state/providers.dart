import 'package:collection/collection.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/state/providers.dart';
import 'sleep_history_notifier.dart';
import 'sleep_history_state.dart';

final selectedYearStateProvider = StateProvider<int>(
  (ref) => DateTime.now().year,
);

final sleepHistoryNotifierProvider =
    AsyncNotifierProvider.autoDispose<SleepHistoryNotifier, SleepHistoryState>(
      SleepHistoryNotifier.new,
    );

final historyYearsFutureProvider = FutureProvider<List<int>>((ref) async {
  final service = ref.read(sleepServiceProvider);
  final result = await service.getHistoryYears();
  return result.when(
    success: (years) => years.sorted((a, b) => b.compareTo(a)),
    failure: (error) {
      return [];
    },
  );
});
