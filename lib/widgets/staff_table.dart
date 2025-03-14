import 'package:flutter/material.dart';
import 'package:stafftabledata/models/staff_model.dart';


class StaffTable extends StatelessWidget {
  final List<Staff> staffData;

  const StaffTable({Key? key, required this.staffData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text("ID")),
          DataColumn(label: Text("Name")),
          DataColumn(label: Text("Email")),
          DataColumn(label: Text("Mobile")),
          DataColumn(label: Text("Status")),
        ],
        rows: staffData.map((staff) {
          return DataRow(cells: [
            DataCell(Text(staff.id.toString())),
            DataCell(Text(staff.name)),
            DataCell(Text(staff.email)),
            DataCell(Text(staff.mobileNumber)),
            DataCell(Text(staff.status)),
          ]);
        }).toList(),
      ),
    );
  }
}
