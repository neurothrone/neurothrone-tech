import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'app_route.dart';

final class AppRouter {
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
