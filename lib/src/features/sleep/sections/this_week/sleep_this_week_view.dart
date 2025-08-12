import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/state/providers.dart';
import '../../shared/widgets/week_logs_switcher.dart';
import 'state/providers.dart';

class SleepThisWeekView extends ConsumerWidget {
  const SleepThisWeekView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logsAsyncState = ref.watch(sleepListNotifierProvider);
    final displayMode = ref.watch(weekDisplayModeStateProvider);
    return WeekLogsSwitcher(
      asyncState: logsAsyncState,
      displayMode: displayMode,
    );
  }
}
