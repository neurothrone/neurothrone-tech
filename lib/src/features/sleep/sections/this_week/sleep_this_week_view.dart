import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'domain/domain.dart';
import 'state/providers.dart';
import 'state/sleep_list_state.dart';
import 'widgets/sleep_log_list.dart';
import 'widgets/week_wake_line_chart.dart';

class SleepThisWeekView extends ConsumerWidget {
  const SleepThisWeekView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sleepLogsAsyncState = ref.watch(
      sleepListNotifierProvider,
    );

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: sleepLogsAsyncState.when(
        data: (SleepListState state) {
          if (state.logs.isEmpty) {
            return const Center(
              child: Text("No sleep logs available for this week."),
            );
          }

          final displayMode = ref.watch(weekDisplayModeStateProvider);
          if (displayMode == WeekDisplayMode.chart) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: WeekWakeLineChart(logs: state.logs),
              // child: WeekWakeBarChart(logs: state.logs),
            );
          }

          return SleepLogList(logs: state.logs);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text("Error loading sleep logs: $error"),
        ),
      ),
    );
  }
}
