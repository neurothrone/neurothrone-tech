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
          icon: const Icon(Icons.first_page),
          tooltip: "First Page",
        ),
        ...pageNumbers.map(
          (page) => TextButton(
            onPressed: enabled && page != currentPage
                ? () => onPageChanged(page)
                : null,
            child: Text(
              page.toString(),
              style: TextStyle(
                fontWeight: page == currentPage ? FontWeight.bold : null,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: enabled && currentPage < totalPages
              ? () => onPageChanged(totalPages)
              : null,
          icon: const Icon(Icons.last_page),
          tooltip: "Last Page",
        ),
      ],
    );
  }
}
