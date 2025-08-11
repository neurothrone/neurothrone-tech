import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';
import '../data/models/models.dart';
import 'services.dart';

final class SleepPrototypeService implements SleepNetworkService {
  final List<SleepLog> _allLogs = _generateFakeLogs();

  static List<SleepLog> _generateFakeLogs() {
    final now = DateTime.now();
    final List<SleepLog> logs = [];

    // --- Recent ~7 weeks (50 days) with a daily ~95 min circadian delay ---
    // Start 49 days ago so we move forward to 'now' (chronological order when sorted)
    final start = DateUtils.dateOnly(now).subtract(const Duration(days: 49));
    const baseWake = 8 * 60; // 08:00 baseline in minutes
    const driftPerDay = 95; // ~1h35m forward per day

    for (int i = 0; i < 50; i++) {
      final day = start.add(Duration(days: i));
      // Drift the wakeup time forward each day, wrap at 24h
      final wakeMinutes = (baseWake + i * driftPerDay) % (24 * 60);
      final wokeUp = atTime(day, wakeMinutes);

      // Sleep duration around 7.5h with small variation that cycles
      final sleepDurationMin = 450 + (i % 30) - 15; // 7h30m ±15m
      final fellAsleep = wokeUp.subtract(Duration(minutes: sleepDurationMin));

      logs.add(SleepLog(wokeUpAt: wokeUp, fellAsleepAt: fellAsleep));
    }

    // --- Last year and two years ago: keep drift but different baseline ---
    for (final year in [now.year - 1, now.year - 2]) {
      final startYear = DateTime(year, 1, 1);
      for (int i = 0; i < 60; i++) {
        final day = startYear.add(Duration(days: i));
        final wakeMinutes =
            (6 * 60 + i * 75) % (24 * 60); // baseline 06:00, ~1h15m drift/day
        final wokeUp = atTime(day, wakeMinutes);
        final sleepDurationMin = 420 + (i % 20) - 10; // ~7h ±10m
        final fellAsleep = wokeUp.subtract(Duration(minutes: sleepDurationMin));
        logs.add(SleepLog(wokeUpAt: wokeUp, fellAsleepAt: fellAsleep));
      }
    }

    return logs;
  }

  @override
  Future<Result<List<SleepLog>, NetworkFailure>>
  getCurrentWeekSleepLogs() async {
    await Future.delayed(const Duration(seconds: 1));

    final now = DateTime.now();
    final currentWeek = now.weekNumber();
    final currentYear = now.year;

    final logs = _allLogs.where((log) {
      final date = log.wokeUpAt;
      return date.weekNumber() == currentWeek && date.year == currentYear;
    }).toList();

    return Result.success(value: logs);
  }

  @override
  Future<Result<List<SleepLog>, NetworkFailure>>
  getPreviousWeekSleepLogs() async {
    await Future.delayed(const Duration(seconds: 1));

    final now = DateTime.now();
    final previousWeekDate = now.subtract(Duration(days: 7));
    final previousWeek = previousWeekDate.weekNumber();
    final year = previousWeekDate.year;

    final logs = _allLogs.where((log) {
      final date = log.wokeUpAt;
      return date.weekNumber() == previousWeek && date.year == year;
    }).toList();

    return Result.success(value: logs);
  }

  @override
  Future<Result<YearlySleepSummary, NetworkFailure>> getYearlySleepSummary({
    required int year,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    final logs = _allLogs.where((log) => log.wokeUpAt.year == year);
    final Map<int, List<SleepLog>> weekMap = {};
    for (final log in logs) {
      final week = log.wokeUpAt.weekNumber();
      weekMap.putIfAbsent(week, () => []).add(log);
    }

    final summaries = weekMap.entries.map((entry) {
      final totalSeconds = entry.value.fold<int>(
        0,
        (sum, log) => sum + log.duration.inSeconds,
      );
      return SleepWeekSummary(
        week: entry.key,
        year: year,
        totalSleepSeconds: totalSeconds,
      );
    }).toList()..sort((a, b) => b.week.compareTo(a.week)); // Descending by week

    return Result.success(
      value: YearlySleepSummary(
        weeklySummaries: summaries,
        totalCount: summaries.length,
      ),
    );
  }

  @override
  Future<Result<SleepWeekSummary, NetworkFailure>> getSleepSummaryForWeek({
    required int year,
    required int week,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    final logs = _allLogs.where((log) {
      final date = log.wokeUpAt;
      return date.year == year && date.weekNumber() == week;
    });
    final totalSeconds = logs.fold<int>(
      0,
      (sum, log) => sum + log.duration.inSeconds,
    );

    return Result.success(
      value: SleepWeekSummary(
        week: week,
        year: year,
        totalSleepSeconds: totalSeconds,
      ),
    );
  }

  @override
  Future<Result<List<int>, NetworkFailure>> getHistoryYears() async {
    await Future.delayed(const Duration(seconds: 1));
    final years = _allLogs.map((e) => e.wokeUpAt.year).toSet().toList()
      ..sort((a, b) => b.compareTo(a));
    return Result.success(value: years);
  }

  @override
  Future<Result<bool, NetworkFailure>> isLikelyAwakeNow() async {
    await Future.delayed(const Duration(seconds: 2));
    // 50% chance to be awake for fun
    return Result.success(value: DateTime.now().millisecond % 10 < 5);
  }
}
