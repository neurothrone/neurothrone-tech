import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../features/home/home_page.dart';
import '../../features/projects/sections/project_detail/project_detail_page.dart';
import '../../features/projects/sections/project_list/projects_page.dart';
import '../../features/sleep/sleep_page.dart';
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
];
