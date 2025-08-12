import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/state/sleep_list_state.dart';
import '../domain/domain.dart';
import 'sleep_week_list_notifier.dart';

final weekViewStateProvider = StateProvider<WeekView>(
  (ref) => WeekView.thisWeek,
);

final weekDisplayModeStateProvider = StateProvider<WeekDisplayMode>((ref) {
  return WeekDisplayMode.list;
});

final sleepListNotifierProvider =
    AsyncNotifierProvider.autoDispose<SleepWeekListNotifier, SleepListState>(
      SleepWeekListNotifier.new,
    );
