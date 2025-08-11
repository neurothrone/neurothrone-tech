import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../../../core/navigation/navigation.dart';
import '../../../shared/data/models/models.dart';

final class ProjectListView extends StatelessWidget {
  const ProjectListView({
    super.key,
    required this.items,
  });

  final List<ProjectItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (_, _) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        final ProjectItem item = items[index];
        return ProjectListTile(item: item);
      },
    );
  }
}

class ProjectListTile extends StatelessWidget {
  const ProjectListTile({
    super.key,
    required this.item,
  });

  final ProjectItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.goNamed(
        AppRoute.projectDetail.name,
        pathParameters: {"slug": item.slug},
      ),
      leading: Icon(
        Icons.folder_open_rounded,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.title, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 4),
          Text(
            item.description,
            style: Theme.of(context).textTheme.bodySmall,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
      trailing: const Icon(Icons.chevron_right_rounded),
    );
  }
}
