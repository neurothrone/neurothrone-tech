import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'navigation.dart';
import 'routes.dart';

final currentLocationProvider = StateProvider<String>((ref) => "/");

final currentRouteProvider = Provider<AppRoute>((ref) {
  final location = ref.watch(currentLocationProvider);
  return getActiveRoute(location);
});

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: "/",
    routes: routes,
    redirect: (context, state) {
      final location = state.matchedLocation;
      final notifier = ref.read(currentLocationProvider.notifier);
      if (notifier.state != location) {
        notifier.state = location;
      }
      // Return null to allow navigation
      return null;
    },
  );
});
