import 'package:flutter/foundation.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'dependencies.dart';

Future<void> setup() async {
  if (kIsWeb) {
    usePathUrlStrategy();
  }

  await dotenv.load(fileName: ".env");

  await initDependencies();
}
