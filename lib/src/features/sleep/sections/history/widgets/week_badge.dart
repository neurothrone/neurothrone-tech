import 'package:flutter/material.dart';

class WeekBadge extends StatelessWidget {
  const WeekBadge({
    super.key,
    required this.week,
  });

  final int week;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$week",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            "WEEK",
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
