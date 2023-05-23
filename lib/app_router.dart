import 'package:go_router/go_router.dart';

import 'home_screen.dart';

enum AppRoute {
  home,
  settings,
}

final router = GoRouter(
  debugLogDiagnostics: false,
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      name: AppRoute.home.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
