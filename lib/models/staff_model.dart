class Staff {
  final int id;
  final String name;
  final String email;
  final String mobileNumber;
  final String status;

  Staff({
    required this.id,
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.status,
  });

  factory Staff.fromJson(Map<String, dynamic> json) {
    return Staff(
      id: json['id'] ?? 0,
      name: json['name'] ?? "N/A",
      email: json['email'] ?? "N/A",
      mobileNumber: json['mobile_number'] ?? "N/A",
      status: json['status'] ?? "N/A",
    );
  }
}