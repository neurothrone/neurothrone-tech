import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/domain.dart';
import '../services/services.dart';
import 'sleep_tab_notifier.dart';

final sleepPreferencesServiceProvider = Provider<SleepPreferencesService>((
  ref,
) {
  return SleepPreferencesService(
    sharedPreferences: SharedPreferencesAsync(),
  );
});

final sleepTabProvider = StateNotifierProvider<SleepTabNotifier, SleepTab>((
  ref,
) {
  final service = ref.watch(sleepPreferencesServiceProvider);
  return SleepTabNotifier(service: service);
});
