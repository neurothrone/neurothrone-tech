import 'dart:async';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/home/ui/pages/home_page.dart';
import '../../features/projects/ui/pages/projects_page.dart';
import 'app_route.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        name: AppRoute.home.name,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: "/projects",
        name: AppRoute.projects.name,
        builder: (context, state) => const ProjectsPage(),
      ),
    ],
  );
});

class AppRouter {
  const AppRouter._internal();

  static Future<T?> go<T>(
    BuildContext context,
    AppRoute route, {
    Map<String, String> pathParameters = const {},
    Map<String, Object> queryParameters = const {},
    Object? extra,
  }) {
    // Ensure queryParameters are String or Iterable<String> for GoRouter
    final Map<String, dynamic> finalQueryParameters = {};
    queryParameters.forEach((key, value) {
      if (value is String || value is Iterable<String>) {
        finalQueryParameters[key] = value;
      } else {
        // Convert other types to string or handle as needed
        finalQueryParameters[key] = value.toString();
      }
    });
    return GoRouter.of(context).pushNamed<T>(
      route.name,
      pathParameters: pathParameters,
      queryParameters: finalQueryParameters,
      extra: extra,
    );
  }

  static void pop(BuildContext context) => GoRouter.of(context).pop();
}
