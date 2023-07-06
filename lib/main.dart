import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:google_fonts/google_fonts.dart';

import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Turns off the # in the URLs on the web
  usePathUrlStrategy();

  // Disable HTTP fetching: fonts are available in assets
  // GoogleFonts.config.allowRuntimeFetching = false;

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString("assets/fonts/LICENSE.txt");
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(
    const AppMain(),
  );
}
