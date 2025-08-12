import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import '../data/models/models.dart';

class WeekWakeLineChart extends StatelessWidget {
  const WeekWakeLineChart({
    super.key,
    required this.logs,
  });

  final List<SleepLog> logs;

  @override
  Widget build(BuildContext context) {
    final sorted = logs.toList()
      ..sort((a, b) => a.wokeUpAt.compareTo(b.wokeUpAt));
    final spots = List.generate(
      sorted.length,
      (index) => FlSpot(
        index.toDouble(),
        sorted[index].wokeUpAt.hour.toDouble() +
            sorted[index].wokeUpAt.minute / 60,
      ),
    );

    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final axisTextStyle = theme.textTheme.bodySmall ?? const TextStyle();
    final tooltipTextStyle = theme.textTheme.labelMedium ?? const TextStyle();

    return Column(
      children: [
        // Legend above the chart
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 10,
              height: 10,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: cs.primary,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            Text(
              "Wake time",
              style: theme.textTheme.labelSmall,
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Chart area
        Expanded(
          child: LineChart(
            LineChartData(
              minY: 0,
              maxY: 24,
              minX: 0,
              maxX: (spots.length - 1).toDouble(),
              clipData: const FlClipData.all(),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: true,
                horizontalInterval: 3,
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: theme.dividerColor, width: 1),
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
                          DateFormat("E").format(d),
                          style: axisTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                ),
              ),
              lineTouchData: LineTouchData(
                handleBuiltInTouches: true,
                touchSpotThreshold: 18,
                touchTooltipData: LineTouchTooltipData(
                  fitInsideHorizontally: true,
                  fitInsideVertically: true,
                  tooltipBorderRadius: BorderRadius.circular(8),
                  tooltipPadding: const EdgeInsets.all(8),
                  tooltipMargin: 8,
                  getTooltipColor: (touchedSpots) =>
                      cs.surfaceContainerHighest.withValues(alpha: 0.9),
                  getTooltipItems: (touchedSpots) {
                    final dateFmt = DateFormat("E d MMM");
                    final timeFmt = DateFormat("HH:mm");
                    return touchedSpots.map((ts) {
                      final i = ts.x.round();
                      final log = sorted[i];
                      final when = dateFmt.format(
                        DateUtils.dateOnly(log.wokeUpAt),
                      );
                      final hhmm = timeFmt.format(log.wokeUpAt);
                      return LineTooltipItem("$when\n$hhmm", tooltipTextStyle);
                    }).toList();
                  },
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  barWidth: 3,
                  color: cs.primary,
                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, barData, index) {
                      return FlDotCirclePainter(
                        radius: 3.5,
                        color: cs.primary,
                        strokeWidth: 1.25,
                        strokeColor: theme.colorScheme.onSurface.withValues(
                          alpha: 0.2,
                        ),
                      );
                    },
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        cs.primary.withValues(alpha: 0.22),
                        cs.primary.withValues(alpha: 0.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
