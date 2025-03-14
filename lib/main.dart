import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stafftabledata/providers/staff_provider.dart';
import 'package:stafftabledata/view/staff_table_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StaffProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StaffTableScreen(),
    );
  }
}
