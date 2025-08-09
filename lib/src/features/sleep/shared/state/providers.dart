import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/setup/dependencies.dart';
import '../../sections/this_week/state/sleep_list_notifier.dart';
import '../../sections/this_week/state/sleep_list_state.dart';
import '../domain/domain.dart';
import '../services/services.dart';
import 'sleep_tab_notifier.dart';

final sleepTabProvider = StateNotifierProvider<SleepTabNotifier, SleepTab>((
  ref,
) {
  return SleepTabNotifier(
    service: serviceLocator<SleepPreferencesService>(),
  );
});

final sleepServiceProvider = Provider<SleepNetworkService>((ref) {
  return serviceLocator<SleepNetworkService>();
});

final sleepListNotifierProvider =
    StateNotifierProvider<SleepListNotifier, AsyncValue<SleepListState>>((
      ref,
    ) {
      final SleepNetworkService service = ref.read(sleepServiceProvider);
      return SleepListNotifier(service: service);
    });
