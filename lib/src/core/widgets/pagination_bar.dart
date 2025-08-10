import 'package:flutter/material.dart';

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
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final bool veryTight = width < 260;
        final bool compact = width < 420;
        final int window = compact
            ? 0
            : (width < 480 ? 3 : (width < 560 ? 5 : 7));
        final double gapSmall = width < 520 ? 4 : 6;
        final double gap = width < 520 ? 8 : 10;
        final double numberPad = width < 520 ? 10 : 16;

        if (window == 0) {
          final String label = veryTight
              ? "$currentPage / $totalPages"
              : "Page $currentPage of $totalPages";

          return PaginationRow(
            gap: gap,
            gapSmall: gapSmall,
            leading: [
              PaginationNavButton(
                icon: Icons.chevron_left,
                tooltip: "Previous Page",
                isEnabled: enabled && currentPage > 1,
                onTap: () => onPageChanged(currentPage - 1),
              ),
            ],
            center: Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            trailing: [
              PaginationNavButton(
                icon: Icons.chevron_right,
                tooltip: "Next Page",
                isEnabled: enabled && currentPage < totalPages,
                onTap: () => onPageChanged(currentPage + 1),
              ),
            ],
          );
        }

        // Numeric mode
        final int half = window ~/ 2;
        int start = currentPage - half;
        int end = currentPage + half;
        if (start < 1) {
          end += (1 - start);
          start = 1;
        }
        if (end > totalPages) {
          start -= (end - totalPages);
          end = totalPages;
        }
        start = start.clamp(1, totalPages);
        end = end.clamp(1, totalPages);
        final pages = List<int>.generate(end - start + 1, (i) => start + i);

        return PaginationRow(
          gap: gap,
          gapSmall: gapSmall,
          leading: [
            PaginationNavButton(
              icon: Icons.first_page,
              tooltip: "First Page",
              isEnabled: enabled && currentPage > 1,
              onTap: () => onPageChanged(1),
            ),
            SizedBox(width: gapSmall),
            PaginationNavButton(
              icon: Icons.chevron_left,
              tooltip: "Previous Page",
              isEnabled: enabled && currentPage > 1,
              onTap: () => onPageChanged(currentPage - 1),
            ),
          ],
          center: Row(
            mainAxisSize: MainAxisSize.min,
            children: pages
                .map(
                  (page) => PaginationNumberButton(
                    page: page,
                    isSelected: page == currentPage,
                    enabled: enabled,
                    onTap: () => onPageChanged(page),
                    numberPad: numberPad,
                    gapSmall: gapSmall,
                  ),
                )
                .toList(),
          ),
          trailing: [
            PaginationNavButton(
              icon: Icons.chevron_right,
              tooltip: "Next Page",
              isEnabled: enabled && currentPage < totalPages,
              onTap: () => onPageChanged(currentPage + 1),
            ),
            SizedBox(width: gapSmall),
            PaginationNavButton(
              icon: Icons.last_page,
              tooltip: "Last Page",
              isEnabled: enabled && currentPage < totalPages,
              onTap: () => onPageChanged(totalPages),
            ),
          ],
        );
      },
    );
  }
}

class PaginationRow extends StatelessWidget {
  const PaginationRow({
    super.key,
    required this.leading,
    required this.center,
    required this.trailing,
    required this.gap,
    required this.gapSmall,
  });

  final List<Widget> leading;
  final Widget center;
  final List<Widget> trailing;
  final double gap;
  final double gapSmall;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...leading,
        SizedBox(width: gap),
        center,
        SizedBox(width: gap),
        ...trailing,
      ],
    );
  }
}

class PaginationNavButton extends StatelessWidget {
  const PaginationNavButton({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.isEnabled,
    required this.onTap,
  });

  final IconData icon;
  final String tooltip;
  final bool isEnabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isEnabled ? 1.0 : 0.35,
      child: IconButton(
        onPressed: isEnabled ? onTap : null,
        icon: Icon(icon),
        tooltip: tooltip,
      ),
    );
  }
}

class PaginationNumberButton extends StatelessWidget {
  const PaginationNumberButton({
    super.key,
    required this.page,
    required this.isSelected,
    required this.enabled,
    required this.onTap,
    required this.numberPad,
    required this.gapSmall,
  });

  final int page;
  final bool isSelected;
  final bool enabled;
  final VoidCallback onTap;
  final double numberPad;
  final double gapSmall;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: gapSmall),
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.24)
              : Colors.transparent,
        ),
        child: TextButton(
          onPressed: enabled && !isSelected ? onTap : null,
          style: TextButton.styleFrom(
            shape: const CircleBorder(),
            padding: EdgeInsets.all(numberPad),
          ),
          child: Text("$page", style: textStyle),
        ),
      ),
    );
  }
}
