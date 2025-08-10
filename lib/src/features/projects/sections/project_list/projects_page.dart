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
            final isLoading = reportsAsyncState.isLoading;

            return reportsAsyncState.maybeWhen(
              data: (ProjectListState result) => PaginationBar(
                currentPage: result.currentPage,
                totalPages: (result.totalCount / result.pageSize).ceil(),
                onPageChanged: (int newPage) => ref
                    .read(projectListNotifierProvider.notifier)
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

class PaginationBar extends StatelessWidget {
  const PaginationBar({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
    this.enabled = true,
  });

  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final List<int> pageNumbers = List.generate(
      3,
          (index) => currentPage - 1 + index,
    ).where((page) => page > 0 && page <= totalPages).toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: enabled && currentPage > 1 ? () => onPageChanged(1) : null,
          icon: Icon(
            Icons.first_page,
            color: currentPage > 1
                ? Colors.white
                : Colors.white.withValues(alpha: 0.3),
          ),
          tooltip: "First Page",
        ),
        const SizedBox(width: 4),
        ...pageNumbers.map(
              (page) => Row(
            children: [
              TextButton(
                onPressed: enabled && page != currentPage
                    ? () => onPageChanged(page)
                    : null,
                style: TextButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(18),
                ),
                child: Text(
                  page.toString(),
                  style: TextStyle(
                    color: enabled && page != currentPage
                        ? Colors.white
                        : Colors.white.withValues(alpha: 0.4),
                    fontWeight: page == currentPage ? FontWeight.bold : null,
                  ),
                ),
              ),
              const SizedBox(width: 4),
            ],
          ),
        ),
        IconButton(
          onPressed: enabled && currentPage < totalPages
              ? () => onPageChanged(totalPages)
              : null,
          icon: Icon(
            Icons.last_page,
            color: currentPage < totalPages
                ? Colors.white
                : Colors.white.withValues(alpha: 0.3),
          ),
          tooltip: "Last Page",
        ),
      ],
    );
  }
}
