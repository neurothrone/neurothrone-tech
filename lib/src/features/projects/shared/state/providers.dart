import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/setup/dependencies.dart';
import '../services/services.dart';

final projectServiceProvider = Provider<ProjectNetworkService>((ref) {
  return serviceLocator<ProjectNetworkService>();
});
