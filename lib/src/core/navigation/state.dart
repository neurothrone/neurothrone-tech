import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_route.dart';

final selectedPageProvider = StateProvider<AppRoute>(
  (ref) => AppRoute.home,
);
