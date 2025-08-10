import 'package:flutter/material.dart';

class AwakeHeader extends StatelessWidget {
  const AwakeHeader({
    super.key,
    required this.isRefreshing,
    required this.onRefresh,
  });

  final bool isRefreshing;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            "Is he up?",
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        IconButton(
          tooltip: isRefreshing ? "Refreshing…" : "Refresh",
          onPressed: isRefreshing ? null : onRefresh,
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
}
