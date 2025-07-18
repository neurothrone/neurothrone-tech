import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/navigation/navigation.dart';
import 'features/home/ui/pages/home_page.dart';
import 'features/projects/ui/pages/projects_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Neurothrone",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final AppPage currentPage = ref.watch(selectedPageProvider);
          return switch (currentPage) {
            AppPage.home => const HomePage(),
            AppPage.projects => const ProjectsPage(),
          };
        },
      ),
    );
  }
}
