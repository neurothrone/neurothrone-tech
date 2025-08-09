import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/providers.dart';

class AppVersionLabel extends ConsumerWidget {
  const AppVersionLabel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final versionAsync = ref.watch(appVersionFutureProvider);

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: DefaultTextStyle(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style:
            Theme.of(context).textTheme.bodySmall ??
            const TextStyle(
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
