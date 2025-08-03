import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/ui/widgets/widgets.dart';
import '../../shared/data/models/models.dart';
import '../state/providers.dart';

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    project.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    "Created date: ${project.createdDate}",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(
        child: Text("Error: $error"),
      ),
    );
  }
}
