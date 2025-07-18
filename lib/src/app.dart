import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/navigation/navigation.dart';
import 'features/home/ui/pages/home_page.dart';
import 'features/projects/ui/pages/projects_page.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppPage currentPage = ref.watch(selectedPageProvider);

    return MaterialApp(
      title: "Neurothrone",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: switch (currentPage) {
        AppPage.home => const HomePage(),
        AppPage.projects => const ProjectsPage(),
      },
    );
  }
}
