import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app.dart';
import 'src/core/setup/setup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setup();

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}
