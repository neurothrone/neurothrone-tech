import 'package:flutter/material.dart';

import '../../../shared/data/models/models.dart';
import 'project_list_tile.dart';

final class ProjectListView extends StatelessWidget {
  const ProjectListView({
    super.key,
    required this.items,
  });

  final List<ProjectItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final ProjectItem item = items[index];
        return ProjectListTile(item: item);
      },
    );
  }
}
