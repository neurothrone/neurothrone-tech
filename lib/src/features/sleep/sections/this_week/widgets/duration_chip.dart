import 'package:flutter/material.dart';

import '../../../../../core/utils/utils.dart';

class DurationChip extends StatelessWidget {
  const DurationChip({
    super.key,
    required this.duration,
  });

  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Theme.of(context).dividerColor.withValues(alpha: 0.5),
          width: 0.5,
        ),
      ),
      child: Text(
        duration.toHoursMinutes(),
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
