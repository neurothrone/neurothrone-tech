import 'app_route.dart';

AppRoute getActiveRoute(String location) {
  if (location.startsWith("/projects")) {
    if (RegExp(r"^/projects/[^/]+$").hasMatch(location)) {
      return AppRoute.projectDetail;
    }
    return AppRoute.projects;
  }
  if (location == "/settings") return AppRoute.settings;
  if (location == "/time") return AppRoute.time;
  if (location == "/") return AppRoute.home;
  return AppRoute.unknown;
}

int getNavRailIndex(AppRoute route) {
  switch (route) {
    case AppRoute.home:
      return 0;
    case AppRoute.projects:
    case AppRoute.projectDetail: // Map detail to projects
      return 1;
    case AppRoute.settings:
      return 2;
    case AppRoute.time:
      return 3;
    default:
      return 0; // Fallback to Home
  }
}
