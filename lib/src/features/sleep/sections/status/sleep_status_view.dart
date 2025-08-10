import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/theme.dart';
import '../../shared/state/providers.dart';

final isLikelyAwakeNowProvider = FutureProvider<bool>((ref) async {
  final service = ref.read(sleepServiceProvider);
  final result = await service.isLikelyAwakeNow();
  return result.when(
    success: (value) => value,
    // success: (value) => throw Exception(),
    failure: (err) => throw Exception(err.message),
  );
});

class AwakePanel extends StatelessWidget {
  const AwakePanel({
    super.key,
    required this.gradient,
    required this.child,
  });

  final Gradient gradient;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
              minHeight: constraints.maxHeight,
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(gradient: gradient),
              // Keep internal padding so content never touches edges
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.topCenter,
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}

class SleepStatusView extends ConsumerWidget {
  const SleepStatusView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(isLikelyAwakeNowProvider);
    final isRefreshing =
        (async.isLoading && async.hasValue) || async.isRefreshing;

    final Gradient gradient = async.when(
      data: (isAwake) => LinearGradient(
        colors: [
          Color.alphaBlend(
            kPrimaryColor.withValues(alpha: 0.06),
            kPanelDarkColor,
          ),
          Color.alphaBlend(
            kPrimaryColor.withValues(alpha: 0.12),
            kSurfaceDarkColor,
          ),
        ],
      ),
      loading: () => const LinearGradient(
        colors: [
          Color(0xFF20232A),
          Color(0xFF2A2F3A),
        ],
      ),
      error: (_, __) => const LinearGradient(
        colors: [
          Color(0xFF3B1F1F),
          Color(0xFF5A2E2E),
        ],
      ),
    );

    Widget leadingHeader(WidgetRef ref) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Text(
              "Is he up?",
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            tooltip: isRefreshing ? "Refreshing…" : "Refresh",
            onPressed: isRefreshing
                ? null
                : () => ref.invalidate(isLikelyAwakeNowProvider),
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: isRefreshing
                  ? const SizedBox(
                      key: ValueKey("spin"),
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.refresh_rounded, key: ValueKey("icon")),
            ),
          ),
        ],
      );
    }

    final Widget body = async.when(
      loading: () => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          leadingHeader(ref),
          const SizedBox(height: 16),
          const Center(child: CircularProgressIndicator()),
          const SizedBox(height: 12),
          Center(
            child: Text(
              "Consulting the Sandman API…",
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              "Crunching REM cycles and coffee levels",
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      error: (e, _) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          leadingHeader(ref),
          const SizedBox(height: 16),
          Center(
            child: Text(
              "Status Offline",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              e.toString(),
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: FilledButton.icon(
              onPressed: () => ref.invalidate(isLikelyAwakeNowProvider),
              icon: const Icon(Icons.refresh_rounded),
              label: const Text("Try again"),
            ),
          ),
        ],
      ),
      data: (isAwake) {
        final accent = isAwake ? kPrimaryColorLight : const Color(0xFFB794F6);
        final title = isAwake ? "Likely awake" : "Probably snoozing";
        final subtitle = isAwake
            ? "Coffee levels: critical. Proceed with memes."
            : "Shh… dreams compiling. Schedule pings for later.";
        final emoji = isAwake ? "😎" : "😴";

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            leadingHeader(ref),
            const SizedBox(height: 8),
            Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, anim) =>
                    ScaleTransition(scale: anim, child: child),
                child: Text(
                  emoji,
                  key: ValueKey(emoji),
                  style: const TextStyle(fontSize: 72),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: ShaderMask(
                shaderCallback: (rect) => LinearGradient(
                  colors: [accent, Colors.white],
                ).createShader(rect),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: accent.withValues(alpha: 0.5)),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.coffee_rounded, size: 18),
                      SizedBox(width: 8),
                      Text("Ping-friendly window open"),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        );
      },
    );

    return AwakePanel(
      gradient: gradient,
      child: body,
    );
  }
}
