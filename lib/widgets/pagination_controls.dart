import 'package:flutter/material.dart';

class PaginationControls extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(int) onPageChange;

  const PaginationControls({
    Key? key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: currentPage > 1 ? () => onPageChange(currentPage - 1) : null,
            child: const Text("Previous"),
          ),
          Text("Page $currentPage of $totalPages"),
          ElevatedButton(
            onPressed: currentPage < totalPages ? () => onPageChange(currentPage + 1) : null,
            child: const Text("Next"),
          ),
        ],
      ),
    );
  }
}
