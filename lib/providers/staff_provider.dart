import 'package:flutter/material.dart';
import 'package:stafftabledata/core/api_service.dart';
import 'package:stafftabledata/models/staff_model.dart';

class StaffProvider with ChangeNotifier {
  final ApiService apiService = ApiService();
  
  List<Staff> _staffData = [];
  int _currentPage = 1;
  int _totalPages = 5; // Define totalPages here
  bool _isLoading = false;

  List<Staff> get staffData => _staffData;
  int get currentPage => _currentPage;
  int get totalPages => _totalPages; // Getter for totalPages
  bool get isLoading => _isLoading;

  StaffProvider() {
    fetchStaff();
  }

  Future<void> fetchStaff() async {
    _isLoading = true;
    notifyListeners();

    try {
      List<Staff> data = await apiService.fetchStaffData(_currentPage, _totalPages, 5);
      _staffData = data;
    } catch (e) {
      print("Error: $e");
    }

    _isLoading = false;
    notifyListeners();
  }

  void changePage(int newPage) {
    if (newPage > 0 && newPage <= _totalPages) {
      _currentPage = newPage;
      fetchStaff();
    }
  }
}
