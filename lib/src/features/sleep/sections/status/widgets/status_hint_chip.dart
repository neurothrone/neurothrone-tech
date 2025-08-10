import 'package:flutter/material.dart';

class StatusHintChip extends StatelessWidget {
  const StatusHintChip({
    super.key,
    required this.accent,
    required this.icon,
    required this.label,
  });

  final Color accent;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Chip should size to its content, but wrap text on narrow screens.
        final double cap = 560; // aesthetic cap for very wide layouts
        final double maxWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth.clamp(0, cap)
            : cap;
        return ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth.toDouble()),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: accent.withValues(alpha: 0.5)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 18),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      label,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
