import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/centered_error_text.dart';
import '../../../../core/widgets/centered_progress_indicator.dart';
import '../../shared/data/models/models.dart';
import '../../shared/state/sleep_list_state.dart';
import '../../shared/widgets/sleep_log_list.dart';
import '../this_week/domain/domain.dart';
import '../this_week/state/providers.dart';
import '../this_week/widgets/week_display_mode_toggle.dart';
import '../this_week/widgets/week_wake_line_chart.dart';
import 'state/providers.dart';

class WeekDetailPage extends StatelessWidget {
  const WeekDetailPage({
    super.key,
    required this.summary,
  });

  final SleepWeekSummary summary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Week ${summary.week}"),
        actions: [
          const WeekDisplayModeToggle(),
        ],
        actionsPadding: EdgeInsets.only(right: 10),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final logsAsync = ref.watch(
            weekDetailNotifierProvider(summary),
          );

          return logsAsync.when(
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
                );
              }

              return SleepLogList(logs: state.logs);
            },
            error: (e, st) => CenteredErrorText(errorMessage: e.toString()),
            loading: () => const CenteredProgressIndicator(),
          );
        },
      ),
    );
  }
}
