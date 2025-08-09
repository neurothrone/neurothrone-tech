import 'package:flutter/material.dart';

import '../../../../../core/utils/utils.dart';
import '../../../shared/data/models/models.dart';
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
    final date = log.wokeUpAt;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date.dayNumber(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            date.monthAbbr().toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              letterSpacing: 1.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              date.weekdayWithTimeLabel(),
              style: Theme.of(context).textTheme.bodyLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ),
        ],
      ),
      trailing: DurationChip(duration: log.duration),
    );
  }
}
