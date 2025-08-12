import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';
import '../../sections/this_week/widgets/day_month_badge.dart';
import '../data/models/models.dart';
import 'duration_chip.dart';

class SleepLogList extends StatelessWidget {
  const SleepLogList({
    super.key,
    required this.logs,
  });

  final List<SleepLog> logs;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: logs.length,
      separatorBuilder: (_, _) => const Divider(),
      itemBuilder: (context, index) => SleepLogListTile(log: logs[index]),
    );
  }
}

class SleepLogListTile extends StatelessWidget {
  const SleepLogListTile({
    super.key,
    required this.log,
  });

  final SleepLog log;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      title: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final showBadge = width >= 300;
          final showChip = width >= 350;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (showBadge) ...[
                DayMonthBadge(date: log.wokeUpAt),
                const SizedBox(width: 16),
              ],
              Expanded(
                child: Text(
                  log.wokeUpAt.weekdayWithTimeLabel(),
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              ),
              if (showChip) ...[
                const SizedBox(width: 8),
                DurationChip(duration: log.duration),
              ],
            ],
          );
        },
      ),
    );
  }
}
