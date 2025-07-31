import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/ui/widgets/widgets.dart';
import '../state/project_list_state.dart';
import '../state/providers.dart';
import 'widgets/project_list_view.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Projects"),
      drawer: const AppDrawer(),
      body: const ProjectsPageBody(),
      persistentFooterButtons: [
        Consumer(
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
      ],
    );
  }
}

class ProjectsPageBody extends ConsumerWidget {
  const ProjectsPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportsAsyncState = ref.watch(projectListProvider);

    return reportsAsyncState.when(
      data: (result) {
        if (result.projects.isEmpty) {
          return const CenteredPlaceholderText(text: "No projects found.");
        }
        return ProjectListView(items: result.projects);
      },
      error: (e, _) => CenteredErrorText(errorMessage: e.toString()),
      loading: () => const CenteredProgressIndicator(),
    );
  }
}
