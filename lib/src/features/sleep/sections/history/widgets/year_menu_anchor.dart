import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/providers.dart';

class YearMenuAnchor extends ConsumerWidget {
  const YearMenuAnchor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final yearsAsync = ref.watch(historyYearsFutureProvider);
    final selectedYear = ref.watch(selectedYearStateProvider);

    final isLoading = yearsAsync.isLoading;
    final currentYear = DateTime.now().year;

    return MenuAnchor(
      builder: (context, controller, child) {
        final iconButton = IconButton(
          tooltip: "Select Year",
          style: Theme.of(context).iconButtonTheme.style,
          onPressed: isLoading
              ? null
              : () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
          icon: AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: isLoading ? 0.5 : 1.0,
            child: const AnimatedSwitcher(
              duration: Duration(milliseconds: 150),
              child: Icon(Icons.calendar_month_rounded),
            ),
          ),
        );

        return iconButton;
      },
      menuChildren: yearsAsync.when(
        data: (years) {
          if (years.isEmpty) {
            // Fallback: show current year as the only option (still disabled visually)
            return [
              MenuItemButton(
                leadingIcon: const Icon(Icons.info_outline),
                onPressed: null,
                child: Text("$currentYear"),
              ),
            ];
          }

          // Order: current year first (if present), then remaining descending
          final remaining = years.where((y) => y != currentYear).toList()
            ..sort((a, b) => b.compareTo(a));
          final ordered = <int>[
            if (years.contains(currentYear)) currentYear,
            ...remaining,
          ];

          return [
            for (final y in ordered)
              MenuItemButton(
                leadingIcon: selectedYear == y
                    ? const Icon(Icons.check, size: 18)
                    : null,
                onPressed: () {
                  ref.read(selectedYearStateProvider.notifier).state = y;
                },
                child: DefaultTextStyle.merge(
                  style: TextStyle(
                    fontWeight: selectedYear == y ? FontWeight.w600 : null,
                  ),
                  child: Text("$y"),
                ),
              ),
          ];
        },
        loading: () => const <Widget>[],
        error: (error, stackTrace) => const <Widget>[],
      ),
    );
  }
}
