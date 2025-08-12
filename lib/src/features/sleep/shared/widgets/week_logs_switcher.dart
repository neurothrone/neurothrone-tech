import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/centered_error_text.dart';
import '../../../../core/widgets/centered_progress_indicator.dart';
import '../../shared/state/sleep_list_state.dart';
import '../../shared/widgets/sleep_log_list.dart';
import '../domain/domain.dart';
import 'week_wake_line_chart.dart';

class WeekLogsSwitcher extends StatelessWidget {
  const WeekLogsSwitcher({
    super.key,
    required this.asyncState,
    required this.displayMode,
  });

  final AsyncValue<SleepListState> asyncState;
  final WeekDisplayMode displayMode;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      child: asyncState.when(
        data: (SleepListState state) {
          if (state.logs.isEmpty) {
            return const Center(
              child: Text("No sleep logs available for this week."),
            );
          }

          if (displayMode == WeekDisplayMode.chart) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: WeekWakeLineChart(logs: state.logs),
            );
          }

          return SleepLogList(logs: state.logs);
        },
        error: (e, st) => CenteredErrorText(errorMessage: e.toString()),
        loading: () => const CenteredProgressIndicator(),
      ),
    );
  }
}
