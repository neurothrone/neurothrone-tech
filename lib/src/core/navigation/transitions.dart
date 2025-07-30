import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

Page<T> fadeTransitionPage<T>({
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
  );
}
