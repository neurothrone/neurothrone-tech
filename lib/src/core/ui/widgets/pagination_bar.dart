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
