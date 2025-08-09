import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/services/services.dart';
import '../../../shared/state/providers.dart';
import '../domain/domain.dart';
import 'sleep_list_notifier.dart';
import 'sleep_list_state.dart';

final weekViewStateProvider = StateProvider<WeekView>(
  (ref) => WeekView.thisWeek,
);

final sleepListNotifierProvider = StateNotifierProvider.autoDispose
    .family<SleepListNotifier, AsyncValue<SleepListState>, WeekView>((
      ref,
      WeekView week,
    ) {
      final SleepNetworkService service = ref.read(sleepServiceProvider);
      return SleepListNotifier(service: service)..loadForWeek(week);
    });
