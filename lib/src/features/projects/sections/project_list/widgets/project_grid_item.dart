import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/navigation/navigation.dart';
import '../../../shared/data/models/models.dart';

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
