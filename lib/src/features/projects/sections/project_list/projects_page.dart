import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/widgets.dart';
import 'domain/project_view_mode.dart';
import 'state/project_list_state.dart';
import 'state/providers.dart';
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
      ],
      body: ProjectsPageBody(),
      bottomNavigationBar: ProjectsPageBottomBar(),
    );
  }
}

class ProjectsPageBody extends ConsumerWidget {
  const ProjectsPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportsAsyncState = ref.watch(projectListNotifierProvider);
    final viewMode = ref.watch(projectViewModeStateProvider);

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
          top: kBorderSide,
        ),
      ),
      child: BottomAppBar(
        child: Consumer(
          builder: (context, ref, _) {
            final reportsAsyncState = ref.watch(projectListNotifierProvider);
            return Builder(
              builder: (_) {
                final data =
                    reportsAsyncState.valueOrNull; // keep last data if any
                final currentPage = data?.currentPage ?? 1;
                final pageSize = data?.pageSize ?? 10;
                final totalPages = data == null
                    ? 1
                    : (data.totalCount / pageSize).ceil();
                // Disable interactions only while loading; keep the bar rendered with last data
                final enabled = !reportsAsyncState.isLoading && data != null;

                return IgnorePointer(
                  ignoring: !enabled,
                  child: AnimatedOpacity(
                    opacity: enabled ? 1.0 : 0.5,
                    duration: const Duration(milliseconds: 150),
                    child: PaginationBar(
                      currentPage: currentPage,
                      totalPages: totalPages,
                      onPageChanged: (int newPage) => ref
                          .read(projectListNotifierProvider.notifier)
                          .searchReports(page: newPage),
                      enabled: enabled,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
