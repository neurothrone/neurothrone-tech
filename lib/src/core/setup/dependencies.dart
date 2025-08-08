// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import '../../features/projects/shared/services/services.dart';
import '../../features/sleep/shared/services/services.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // serviceLocator.registerLazySingleton<ProjectNetworkService>(
  //   () {
  //     final baseApiUrl = dotenv.env["BACKEND_API_BASE_URL"];
  //     if (baseApiUrl == null) {
  //       throw Exception("BACKEND_API_BASE_URL is not defined in .env file");
  //     }
  //     return ProjectApiService(
  //       baseApiUrl: baseApiUrl,
  //       // showDebugInfo: true,
  //     );
  //   },
  // );

  serviceLocator.registerLazySingleton<ProjectNetworkService>(
    () => ProjectPrototypeService(),
  );

  serviceLocator.registerLazySingleton<SleepNetworkService>(
    () => SleepPrototypeService(),
  );
}
