import 'package:flutter/material.dart';

import '../../../../core/ui/widgets/widgets.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({
    super.key,
    required this.projectId,
  });

  final String projectId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Project Details"),
      body: Center(
        child: Text("Details for project ID: $projectId"),
      ),
    );
  }
}
