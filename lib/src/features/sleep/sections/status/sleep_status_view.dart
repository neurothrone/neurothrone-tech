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

class SleepStatusView extends ConsumerWidget {
  const SleepStatusView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(isLikelyAwakeNowProvider);

    final isRefreshing =
        (async.isLoading && async.hasValue) || async.isRefreshing;

    if (async.isLoading && !async.hasValue) {
      return const AwakeLoadingCard(key: ValueKey("loading"));
    }

    if (async.hasError) {
      return AwakeErrorCard(
        key: const ValueKey("error"),
        message: async.error.toString(),
        onRetry: () => ref.invalidate(isLikelyAwakeNowProvider),
      );
    }

    return AwakeStatusCard(
      key: const ValueKey("status-card"),
      isAwake: async.value ?? false,
      isRefreshing: isRefreshing,
      onRefresh: () => ref.invalidate(isLikelyAwakeNowProvider),
    );
  }
}

class AwakeLoadingCard extends StatelessWidget {
  const AwakeLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox.expand(
          child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: SizedBox(
                width: double.infinity,
                child: AwakeDecoratedCard(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF20232A),
                      Color(0xFF2A2F3A),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 8),
                      const CircularProgressIndicator(),
                      const SizedBox(height: 16),
                      Text(
                        "Consulting the Sandman API…",
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Crunching REM cycles and coffee levels",
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AwakeErrorCard extends StatelessWidget {
  const AwakeErrorCard({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox.expand(
          child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: SizedBox(
                width: double.infinity,
                child: AwakeDecoratedCard(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF3B1F1F),
                      Color(0xFF5A2E2E),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Status Offline",
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        message,
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      FilledButton.icon(
                        onPressed: onRetry,
                        icon: const Icon(Icons.refresh_rounded),
                        label: const Text("Try again"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AwakeStatusCard extends StatefulWidget {
  const AwakeStatusCard({
    super.key,
    required this.isAwake,
    required this.isRefreshing,
    required this.onRefresh,
  });

  final bool isAwake;
  final bool isRefreshing;
  final VoidCallback onRefresh;

  @override
  State<AwakeStatusCard> createState() => _AwakeStatusCardState();
}

class _AwakeStatusCardState extends State<AwakeStatusCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final awake = widget.isAwake;
    final title = awake ? "Likely awake" : "Probably snoozing";
    final subtitle = awake
        ? "Coffee levels: critical. Proceed with memes."
        : "Shh… dreams compiling. Schedule pings for later.";
    final emoji = awake ? "😎" : "😴";
    final accent = awake ? kPrimaryColorLight : const Color(0xFFB794F6);

    return SizedBox.expand(
      child: Align(
        alignment: Alignment.topCenter,
        child: AwakeDecoratedCard(
          gradient: LinearGradient(
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Is he up?",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    tooltip: widget.isRefreshing ? "Refreshing…" : "Refresh",
                    onPressed: widget.isRefreshing ? null : widget.onRefresh,
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: widget.isRefreshing
                          ? const SizedBox(
                              key: ValueKey("spin"),
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            )
                          : const Icon(
                              key: ValueKey("icon"),
                              Icons.refresh_rounded,
                            ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, anim) => ScaleTransition(
                  scale: anim,
                  child: child,
                ),
                child: Text(
                  emoji,
                  key: ValueKey(emoji),
                  style: const TextStyle(fontSize: 72),
                ),
              ),
              const SizedBox(height: 8),
              ShaderMask(
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
              const SizedBox(height: 8),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              FadeTransition(
                opacity: Tween(begin: 0.6, end: 1.0).animate(
                  CurvedAnimation(
                    parent: _controller,
                    curve: Curves.easeInOut,
                  ),
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: accent.withValues(alpha: 0.5)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          widget.isAwake
                              ? Icons.coffee_rounded
                              : Icons.nightlight_round_rounded,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          widget.isAwake
                              ? "Ping-friendly window open"
                              : "DMs queueing until wake",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class AwakeDecoratedCard extends StatelessWidget {
  const AwakeDecoratedCard({
    super.key,
    required this.child,
    required this.gradient,
  });

  final Widget child;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      padding: const EdgeInsets.all(16),
      child: child,
    );
  }
}
