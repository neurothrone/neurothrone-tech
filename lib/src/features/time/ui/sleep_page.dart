import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/ui/widgets/widgets.dart';
import '../domain/domain.dart';
import '../state/providers.dart';
import 'widgets/sleep_page_tab_bar.dart';

class SleepPage extends StatelessWidget {
  const SleepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: "Sleep",
      body: SleepPageBody(),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(),
          SleepPageTabBar(),
        ],
      ),
    );
  }
}

class SleepPageBody extends ConsumerWidget {
  const SleepPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(sleepTabProvider);

    return switch (currentTab) {
      SleepTab.status => const Center(child: Text("Sleep Status")),
      SleepTab.thisWeek => const Center(child: Text("This Week's Sleep Data")),
      SleepTab.history => const Center(child: Text("Sleep History")),
    };
  }
}
