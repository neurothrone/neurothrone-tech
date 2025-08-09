import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/state/providers.dart';
import 'sleep_history_notifier.dart';
import 'sleep_history_state.dart';

final sleepHistoryNotifierProvider = StateNotifierProvider.autoDispose
    .family<SleepHistoryNotifier, AsyncValue<SleepHistoryState>, int>((
      ref,
      int year,
    ) {
      final service = ref.watch(sleepServiceProvider);
      return SleepHistoryNotifier(service: service)..loadForYear(year);
    });
