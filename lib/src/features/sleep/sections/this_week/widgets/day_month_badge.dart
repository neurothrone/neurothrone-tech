import 'package:flutter/material.dart';

import '../../../../../core/utils/utils.dart';

class DayMonthBadge extends StatelessWidget {
  const DayMonthBadge({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          date.dayNumber(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          date.monthAbbr().toUpperCase(),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            letterSpacing: 1.5,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
