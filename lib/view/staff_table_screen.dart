import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stafftabledata/providers/staff_provider.dart';
import 'package:stafftabledata/widgets/pagination_controls.dart';
import 'package:stafftabledata/widgets/staff_table.dart';

class StaffTableScreen extends StatelessWidget {
  const StaffTableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final staffProvider = Provider.of<StaffProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Staff List")),
      body: staffProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(child: StaffTable(staffData: staffProvider.staffData)),
                PaginationControls(
                  currentPage: staffProvider.currentPage,
                  totalPages: staffProvider.totalPages, // ✅ Fixed totalPages reference
                  onPageChange: staffProvider.changePage,
                ),
              ],
            ),
    );
  }
}
