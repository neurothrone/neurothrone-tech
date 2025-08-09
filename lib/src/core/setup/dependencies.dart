// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  // !: Core
  serviceLocator.registerLazySingleton<SharedPreferencesAsync>(
    () => SharedPreferencesAsync(),
  );

  // !: Projects
  serviceLocator.registerLazySingleton<ProjectNetworkService>(
    () => ProjectPrototypeService(),
  );

  // !: Sleep
  serviceLocator.registerLazySingleton<SleepPreferencesService>(
    () => SleepPreferencesService(
      sharedPreferences: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<SleepNetworkService>(
    () => SleepPrototypeService(),
  );
}
