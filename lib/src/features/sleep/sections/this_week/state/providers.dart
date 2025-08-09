import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/domain.dart';
import 'sleep_list_notifier.dart';
import 'sleep_list_state.dart';

final weekViewStateProvider = StateProvider<WeekView>(
  (ref) => WeekView.thisWeek,
);

final sleepListNotifierProvider =
    AsyncNotifierProvider.autoDispose<SleepListNotifier, SleepListState>(
      SleepListNotifier.new,
    );
