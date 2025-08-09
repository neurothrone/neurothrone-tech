import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/ui/widgets/widgets.dart';
import '../../shared/data/models/models.dart';
import 'state/providers.dart';
import 'widgets/project_details_view.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({
    super.key,
    required this.projectSlug,
  });

  final String projectSlug;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Project Details"),
      body: ProjectDetailBody(projectSlug: projectSlug),
    );
  }
}

class ProjectDetailBody extends ConsumerWidget {
  const ProjectDetailBody({
    super.key,
    required this.projectSlug,
  });

  final String projectSlug;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectState = ref.watch(projectDetailProvider(projectSlug));

    return projectState.when(
      data: (ProjectDetails? project) => project == null
          ? Center(
              child: Text(
                "Project not found",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ProjectDetailsView(project: project),
            ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(
        child: Text("Error: $error"),
      ),
    );
  }
}
