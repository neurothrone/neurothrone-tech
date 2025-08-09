import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/providers.dart';

class YearMenuAnchor extends ConsumerWidget {
  const YearMenuAnchor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final yearsAsync = ref.watch(historyYearsFutureProvider);
    final isLoading = yearsAsync.isLoading;
    // final isLoading = true;

    return MenuAnchor(
      builder: (context, controller, child) {
        return IconButton(
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
          icon: const Icon(Icons.calendar_month_rounded),
        );
      },
      menuChildren: isLoading
          ? []
          : yearsAsync.when(
              data: (years) {
                if (years.isEmpty) {
                  return [
                    MenuItemButton(
                      child: Text(DateTime.now().year.toString()),
                      onPressed: () {},
                    ),
                  ];
                }

                return years.map((year) {
                  return MenuItemButton(
                    child: Text(year.toString()),
                    onPressed: () {
                      ref.read(selectedYearStateProvider.notifier).state = year;
                    },
                  );
                }).toList();
              },
              loading: () => [],
              error: (error, stackTrace) => [],
            ),
    );
  }
}
