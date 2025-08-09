import 'package:flutter/material.dart';

import '../../../shared/data/models/models.dart';

class ProjectDetailsView extends StatelessWidget {
  const ProjectDetailsView({
    super.key,
    required this.project,
  });

  final ProjectDetails project;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          "https://picsum.photos/200",
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error, size: 50);
          },
        ),
        const SizedBox(height: 16.0),
        Text(
          project.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 8.0),
        Text(
          ["Dart", "Flutter"].join(" | "),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
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
    );
  }
}
