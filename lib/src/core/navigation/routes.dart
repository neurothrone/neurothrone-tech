import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../features/home/ui/home_page.dart';
import '../../features/projects/project_detail/ui/project_detail_page.dart';
import '../../features/projects/project_list/ui/projects_page.dart';
import '../../features/settings/ui/settings_page.dart';
import '../../features/sleep/shared/ui/sleep_page.dart';
import 'app_route.dart';
import 'transitions.dart';

final List<GoRoute> routes = [
  GoRoute(
    path: "/",
    name: AppRoute.home.name,
    pageBuilder: (_, state) => fadeTransitionPage(
      state: state,
      child: const HomePage(),
    ),
  ),
  GoRoute(
    path: "/projects",
    name: AppRoute.projects.name,
    pageBuilder: (_, state) => fadeTransitionPage(
      state: state,
      child: const ProjectsPage(),
    ),
    routes: [
      GoRoute(
        path: ":slug",
        name: AppRoute.projectDetail.name,
        pageBuilder: (context, state) {
          final slug = state.pathParameters["slug"] ?? "";
          return MaterialPage(
            child: ProjectDetailPage(projectSlug: slug),
          );
        },
      ),
    ],
  ),
  GoRoute(
    path: "/sleep",
    name: AppRoute.sleep.name,
    pageBuilder: (_, state) => fadeTransitionPage(
      state: state,
      child: const SleepPage(),
    ),
  ),
  GoRoute(
    path: "/settings",
    name: AppRoute.settings.name,
    pageBuilder: (_, state) => fadeTransitionPage(
      state: state,
      child: const SettingsPage(),
    ),
  ),
];
