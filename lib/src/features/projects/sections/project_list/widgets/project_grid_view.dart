import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/navigation/navigation.dart';
import '../../../shared/data/models/models.dart';

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

class ProjectGridItem extends StatelessWidget {
  const ProjectGridItem({
    super.key,
    required this.item,
  });

  final ProjectItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppDimensions.elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
      ),
      surfaceTintColor: Colors.deepPurpleAccent,
      child: InkWell(
        onTap: () => context.goNamed(
          AppRoute.projectDetail.name,
          pathParameters: {"slug": item.slug},
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: Theme.of(context).textTheme.headlineMedium,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4.0),
              Text(
                item.description,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
