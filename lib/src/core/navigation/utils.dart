import 'app_route.dart';

AppRoute getActiveRoute(String location) {
  if (location.startsWith("/projects")) {
    if (RegExp(r"^/projects/[^/]+$").hasMatch(location)) {
      return AppRoute.projectDetail;
    }
    return AppRoute.projects;
  }

  return switch (location) {
    "/contact" => AppRoute.contact,
    "/sleep" => AppRoute.sleep,
    "/" => AppRoute.home,
    _ => AppRoute.unknown,
  };
}

int getNavRailIndex(AppRoute route) {
  switch (route) {
    case AppRoute.home:
      return 0;
    case AppRoute.contact:
      return 1;
    case AppRoute.projects:
    case AppRoute.projectDetail: // Map detail to projects
      return 2;
    case AppRoute.sleep:
      return 3;
    default:
      return 0; // Fallback to Home
  }
}
