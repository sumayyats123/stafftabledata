import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stafftabledata/core/constants.dart';
import 'package:stafftabledata/models/staff_model.dart';

class ApiService {
  Future<List<Staff>> fetchStaffData(int page, int totalPages, int pageSize) async {
    int apiPage = totalPages - page + 1;
    String url = "$baseUrl?page=$apiPage&page_size=$pageSize&ordering=id";

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<dynamic> results = data['results'] ?? [];

        return results.map((json) => Staff.fromJson(json)).toList()
          ..sort((a, b) => a.id.compareTo(b.id)); // Sort by ID ascending
      } else {
        throw Exception("Failed to fetch data: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Error: $error");
    }
  }
}