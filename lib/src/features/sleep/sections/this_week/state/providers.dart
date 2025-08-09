import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/services/services.dart';
import '../../../shared/state/providers.dart';
import '../domain/domain.dart';
import 'sleep_list_notifier.dart';
import 'sleep_list_state.dart';

final weekViewStateProvider = StateProvider<WeekView>(
  (ref) => WeekView.thisWeek,
);

final sleepListNotifierProvider =
    StateNotifierProvider<SleepListNotifier, AsyncValue<SleepListState>>((
      ref,
    ) {
      final SleepNetworkService service = ref.read(sleepServiceProvider);
      return SleepListNotifier(service: service);
    });
