import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'routing/app_router.dart';

class AppMain extends StatelessWidget {
  const AppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Neurothrone",
      routerConfig: router,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // textTheme: GoogleFonts.michromaTextTheme(),
        // textTheme: GoogleFonts.exo2TextTheme(),
        textTheme: GoogleFonts.audiowideTextTheme(),
      ),
    );
  }
}
