import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_page.dart';

final selectedPageProvider = StateProvider<AppPage>(
  (ref) => AppPage.home,
);
