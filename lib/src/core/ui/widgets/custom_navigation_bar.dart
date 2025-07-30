import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../navigation/navigation.dart';

class CustomNavigationBar extends ConsumerWidget {
  const CustomNavigationBar({super.key});

  static const routes = [
    AppRoute.home,
    AppRoute.projects,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppRoute selectedPage = ref.watch(selectedPageProvider);

    return NavigationBar(
      selectedIndex: routes.indexOf(selectedPage),
      onDestinationSelected: (index) {
        final route = routes[index];
        if (route != selectedPage) {
          ref.read(selectedPageProvider.notifier).state = route;
        }
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home),
          label: "Home",
          tooltip: "Go to Home",
        ),
        NavigationDestination(
          icon: Icon(Icons.work),
          label: "Projects",
          tooltip: "Go to Projects",
        ),
      ],
    );
  }
}
