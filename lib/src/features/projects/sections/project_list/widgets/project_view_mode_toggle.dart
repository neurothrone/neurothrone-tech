import "package:flutter/material.dart";

import "package:flutter_riverpod/flutter_riverpod.dart";

import "../domain/project_view_mode.dart";
import "../state/providers.dart";

class ProjectViewModeToggle extends ConsumerWidget {
  const ProjectViewModeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewMode = ref.watch(projectViewModeStateProvider);
    final notifier = ref.read(projectViewModeStateProvider.notifier);

    return IconButton(
      tooltip: viewMode == ProjectViewMode.list
          ? "Switch to Grid View"
          : "Switch to List View",
      icon: Icon(
        viewMode == ProjectViewMode.list
            ? Icons.grid_view_rounded
            : Icons.view_list_rounded,
      ),
      style: Theme.of(context).iconButtonTheme.style,
      onPressed: () {
        notifier.state = viewMode == ProjectViewMode.list
            ? ProjectViewMode.grid
            : ProjectViewMode.list;
      },
    );
  }
}
