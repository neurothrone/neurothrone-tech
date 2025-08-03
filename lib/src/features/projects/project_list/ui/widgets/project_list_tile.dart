import 'package:flutter/material.dart';

import '../../../project_detail/ui/project_detail_page.dart';
import '../../../shared/data/models/models.dart';

class ProjectListTile extends StatelessWidget {
  const ProjectListTile({
    super.key,
    required this.item,
  });

  final ProjectItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            fullscreenDialog: true,
            builder: (_) => ProjectDetailPage(projectSlug: item.slug),
          ),
        );
      },
      leading: Icon(
        Icons.report_problem_outlined,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Text(
        item.title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(item.description),
      trailing: const Icon(Icons.chevron_right_rounded),
    );
  }
}
