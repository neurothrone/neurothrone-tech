import 'package:flutter/material.dart';

import '../../../../../core/utils/utils.dart';
import '../../../shared/data/models/models.dart';
import '../../../shared/widgets/duration_chip.dart';
import 'week_badge.dart';

class SleepHistoryList extends StatelessWidget {
  const SleepHistoryList({
    super.key,
    required this.summaries,
  });

  final List<SleepWeekSummary> summaries;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: summaries.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) => SleepHistoryListTile(
        summary: summaries[index],
      ),
    );
  }
}

class SleepHistoryListTile extends StatelessWidget {
  const SleepHistoryListTile({
    super.key,
    required this.summary,
  });

  final SleepWeekSummary summary;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      title: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          // Responsive thresholds for showing optional pieces
          final showBadge = width >= 300;
          final showChip = width >= 380;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (showBadge) ...[
                WeekBadge(week: summary.week),
                const SizedBox(width: 8),
              ],
              Expanded(
                child: Text(
                  formatIsoWeekRange(year: summary.year, week: summary.week),
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              ),
              if (showChip) ...[
                const SizedBox(width: 8),
                DurationChip(duration: summary.averageSleepPerDay),
              ],
              const SizedBox(width: 8),
              const Icon(Icons.chevron_right_rounded),
            ],
          );
        },
      ),
      onTap: () {},
    );
  }
}
