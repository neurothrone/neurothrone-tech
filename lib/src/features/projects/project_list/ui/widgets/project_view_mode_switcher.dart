import "package:flutter/material.dart";

import "package:flutter_riverpod/flutter_riverpod.dart";

import "../../domain/project_view_mode.dart";
import "../../state/providers.dart";

class ProjectViewModeSwitcher extends ConsumerWidget {
  const ProjectViewModeSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(projectViewModeProvider);
    final notifier = ref.read(projectViewModeProvider.notifier);

    return IconButton(
      onPressed: () {
        notifier.state = mode == ProjectViewMode.list
            ? ProjectViewMode.grid
            : ProjectViewMode.list;
      },
      icon: Icon(
        mode == ProjectViewMode.list
            ? Icons.grid_view_rounded
            : Icons.view_list_rounded,
      ),
      tooltip: mode == ProjectViewMode.list
          ? "Switch to Grid View"
          : "Switch to List View",
    );
  }
}
