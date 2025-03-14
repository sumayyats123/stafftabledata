import 'package:flutter/material.dart';
import 'package:stafftabledata/core/api_service.dart';
import 'package:stafftabledata/core/constants.dart';
import 'package:stafftabledata/models/staff_model.dart';
import 'package:stafftabledata/widgets/pagination_controls.dart';
import 'package:stafftabledata/widgets/staff_table.dart';




class StaffTableScreen extends StatefulWidget {
  const StaffTableScreen({Key? key}) : super(key: key);

  @override
  _StaffTableScreenState createState() => _StaffTableScreenState();
}

class _StaffTableScreenState extends State<StaffTableScreen> {
  final ApiService apiService = ApiService();
  List<Staff> staffData = [];
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    fetchStaff();
  }

  Future<void> fetchStaff() async {
    try {
      List<Staff> data = await apiService.fetchStaffData(currentPage, totalPages, pageSize);
      setState(() {
        staffData = data;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
    fetchStaff();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Staff List")),
      body: Column(
        children: [
          Expanded(child: StaffTable(staffData: staffData)),
          PaginationControls(
            currentPage: currentPage,
            totalPages: totalPages,
            onPageChange: changePage,
          ),
        ],
      ),
    );
  }
}
