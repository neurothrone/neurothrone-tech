import 'package:flutter/material.dart';

import '../../../../core/ui/widgets/widgets.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Projects"),
      bottomNavigationBar: CustomNavigationBar(),
      body: Center(
        child: Text("Projects"),
      ),
    );
  }
}
