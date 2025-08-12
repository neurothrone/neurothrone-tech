import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import '../data/models/models.dart';

class WeekWakeBarChart extends StatelessWidget {
  const WeekWakeBarChart({super.key, required this.logs});

  final List<SleepLog> logs;

  double _toHourDouble(DateTime dt) => dt.hour + dt.minute / 60.0;

  @override
  Widget build(BuildContext context) {
    if (logs.isEmpty) {
      return const Center(child: Text("No data for this week"));
    }

    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final axisTextStyle = theme.textTheme.bodySmall ?? const TextStyle();
    final tooltipTextStyle = theme.textTheme.labelMedium ?? const TextStyle();

    // Sort by wokeUpAt for stable Mon..Sun ordering
    final sorted = [...logs]..sort((a, b) => a.wokeUpAt.compareTo(b.wokeUpAt));

    // Build bar groups: one per day, a single rod spanning Sleep -> Wake.
    // If fellAsleepAt is null, draw a short cap at the wake time.
    final groups = <BarChartGroupData>[];
    const markerHeight = 0.25; // ~15 minutes visual cap when sleep start is unknown

    for (var i = 0; i < sorted.length; i++) {
      final log = sorted[i];
      final wakeY = _toHourDouble(log.wokeUpAt);

      // Determine start of the bar. If unknown, use a short cap just below wake.
      final bool unknownStart = log.fellAsleepAt == null;
      final fromY = unknownStart
          ? (wakeY - markerHeight).clamp(0.0, wakeY)
          : _toHourDouble(log.fellAsleepAt!);

      final rod = BarChartRodData(
        fromY: fromY,
        toY: wakeY,
        width: 14,
        borderRadius: BorderRadius.circular(6),
        color: unknownStart ? cs.primary.withOpacity(0.6) : cs.primary,
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          toY: 24,
          color: cs.surfaceVariant.withOpacity(0.25),
        ),
      );

      groups.add(
        BarChartGroupData(
          x: i,
          barsSpace: 6,
          barRods: [rod],
        ),
      );
    }

    final dateFmt = DateFormat("E"); // Mon, Tue, ...
    final fullDateFmt = DateFormat("E d MMM");
    final timeFmt = DateFormat("HH:mm");

    // Small legend
    final legend = Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8),
      child: Wrap(
        spacing: 16,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          _LegendDot(label: "Sleep → Wake", color: cs.primary),
          _LegendDot(label: "Unknown start", color: cs.primary.withOpacity(0.6)),
        ],
      ),
    );

    return Column(
      children: [
        legend,
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: BarChart(
              BarChartData(
                minY: 0,
                maxY: 24,
                barGroups: groups,
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: 3,
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(
                    color: theme.dividerColor,
                    width: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 3,
                      reservedSize: 44,
                      getTitlesWidget: (value, meta) {
                        final v = value.clamp(0, 24);
                        final h = v.toInt();
                        return Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: Text(
                            "${h.toString().padLeft(2, "0")}:00",
                            style: axisTextStyle,
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      getTitlesWidget: (value, meta) {
                        if (value % 1 != 0) return const SizedBox.shrink();
                        final i = value.toInt();
                        if (i < 0 || i >= sorted.length) {
                          return const SizedBox.shrink();
                        }
                        final d = DateUtils.dateOnly(sorted[i].wokeUpAt);
                        return Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            dateFmt.format(d),
                            style: axisTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      final log = sorted[groupIndex];
                      final date = fullDateFmt.format(
                        DateUtils.dateOnly(log.wokeUpAt),
                      );
                      final woke = timeFmt.format(log.wokeUpAt);
                      final slept = log.fellAsleepAt != null
                          ? timeFmt.format(log.fellAsleepAt!)
                          : "–";
                      return BarTooltipItem(
                        "$date\nSlept: $slept\nWoke:  $woke",
                        tooltipTextStyle,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LegendDot extends StatelessWidget {
  const _LegendDot({
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final textStyle =
        Theme.of(context).textTheme.labelSmall ?? const TextStyle();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.only(right: 6),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        Text(label, style: textStyle),
      ],
    );
  }
}
