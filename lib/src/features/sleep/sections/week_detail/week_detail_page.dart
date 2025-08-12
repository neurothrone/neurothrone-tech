import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/centered_error_text.dart';
import '../../../../core/widgets/centered_progress_indicator.dart';
import '../../shared/data/models/models.dart';
import '../../shared/widgets/sleep_log_list.dart';
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
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final logsAsync = ref.watch(
            weekDetailNotifierProvider(summary),
          );

          return logsAsync.when(
            data: (state) {
              final logs = state.logs;

              if (logs.isEmpty) {
                return const Center(
                  child: Text("No sleep logs for this week."),
                );
              }

              return SleepLogList(logs: logs);
            },
            error: (e, st) => CenteredErrorText(errorMessage: e.toString()),
            loading: () => const CenteredProgressIndicator(),
          );
        },
      ),
    );
  }
}
