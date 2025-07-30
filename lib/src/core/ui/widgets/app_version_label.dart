import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/app_version_provider.dart';

class AppVersionLabel extends ConsumerWidget {
  const AppVersionLabel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final versionAsync = ref.watch(appVersionProvider);

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: DefaultTextStyle(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
        child: versionAsync.when(
          data: (version) => Text(version),
          error: (_, _) {
            return const Text(
              "Version unknown",
              style: TextStyle(color: Colors.red),
            );
          },
          loading: () => Text("Loading..."),
        ),
      ),
    );
  }
}
