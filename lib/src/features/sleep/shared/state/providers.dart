import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/setup/dependencies.dart';
import '../domain/domain.dart';
import '../services/services.dart';
import 'sleep_tab_notifier.dart';

final sleepServiceProvider = Provider<SleepNetworkService>((ref) {
  return serviceLocator<SleepNetworkService>();
});

final sleepTabNotifierProvider =
    StateNotifierProvider<SleepTabNotifier, SleepTab>((
      ref,
    ) {
      return SleepTabNotifier(
        service: serviceLocator<SleepPreferencesService>(),
      );
    });
