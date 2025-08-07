import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/ui/theme/constants.dart';
import '../../../../core/ui/widgets/widgets.dart';
import '../domain/project_view_mode.dart';
import '../state/project_list_state.dart';
import '../state/providers.dart';
import 'widgets/project_grid_view.dart';
import 'widgets/project_view_mode_switcher.dart';
import 'widgets/project_list_view.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: "Projects",
      actions: [
        ProjectViewModeSwitcher(),
        ProjectsRefreshButton(),
      ],
      body: ProjectsPageBody(),
      bottomNavigationBar: ProjectsPageBottomBar(),
    );
  }
}

class ProjectsRefreshButton extends ConsumerWidget {
  const ProjectsRefreshButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportsAsyncState = ref.watch(projectListProvider);
    final isLoading = reportsAsyncState.isLoading;

    return IconButton(
      tooltip: "Refresh Projects",
      icon: const Icon(Icons.refresh_rounded),
      style: Theme.of(context).iconButtonTheme.style,
      onPressed: isLoading
          ? null
          : () => ref.read(projectListProvider.notifier).searchReports(),
    );
  }
}

class ProjectsPageBody extends ConsumerWidget {
  const ProjectsPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportsAsyncState = ref.watch(projectListProvider);
    final viewMode = ref.watch(projectViewModeProvider);

    return reportsAsyncState.when(
      data: (ProjectListState state) {
        if (state.projects.isEmpty) {
          return const CenteredPlaceholderText(text: "No projects found.");
        }

        return viewMode == ProjectViewMode.list
            ? ProjectListView(items: state.projects)
            : ProjectGridView(items: state.projects);
      },
      error: (e, _) => CenteredErrorText(errorMessage: e.toString()),
      loading: () => const CenteredProgressIndicator(),
    );
  }
}

class ProjectsPageBottomBar extends StatelessWidget {
  const ProjectsPageBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: kDividerBorderSide,
        ),
      ),
      child: BottomAppBar(
        child: Consumer(
          builder: (context, ref, _) {
            final reportsAsyncState = ref.watch(projectListProvider);
            final isLoading = reportsAsyncState.isLoading;

            return reportsAsyncState.maybeWhen(
              data: (ProjectListState result) => PaginationBar(
                currentPage: result.currentPage,
                totalPages: (result.totalCount / result.pageSize).ceil(),
                onPageChanged: (int newPage) => ref
                    .read(projectListProvider.notifier)
                    .searchReports(page: newPage),
                enabled: !isLoading,
              ),
              orElse: () => PaginationBar(
                currentPage: 1,
                totalPages: 1,
                onPageChanged: (_) {},
                enabled: false,
              ),
            );
          },
        ),
      ),
    );
  }
}
