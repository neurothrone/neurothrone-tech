import 'package:flutter/material.dart';

import '../../../shared/data/models/models.dart';
import 'project_grid_item.dart';

class ProjectGridView extends StatelessWidget {
  const ProjectGridView({
    super.key,
    required this.items,
  });

  final List<ProjectItem> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 1.5,
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final ProjectItem item = items[index];
        return ProjectGridItem(item: item);
      },
    );
  }
}
