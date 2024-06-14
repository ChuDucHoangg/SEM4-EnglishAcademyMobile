class ProfileModel {
  final int id;
  final String code;
  final String fullName;
  final String email;
  final String phone;
  final bool status;
  final String gender;
  final DateTime dayOfBirth;
  final String address;
  final DateTime startDate;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final String createdBy;
  final String modifiedBy;

  ProfileModel({
    required this.id,
    required this.code,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.status,
    required this.gender,
    required this.dayOfBirth,
    required this.address,
    required this.startDate,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] ?? 0,
      code: json['code'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      status: json['status'] is bool ? json['status'] : json['status'] == 'true',
      gender: json['gender'] ?? '',
      dayOfBirth: json['dayOfBirth'] != null ? DateTime.parse(json['dayOfBirth']) : DateTime.now(),
      address: json['address'] ?? '',
      startDate: json['startDate'] != null ? DateTime.parse(json['startDate']) : DateTime.now(),
      createdDate: json['createdDate'] != null ? DateTime.parse(json['createdDate']) : DateTime.now(),
      modifiedDate: json['modifiedDate'] != null ? DateTime.parse(json['modifiedDate']) : DateTime.now(),
      createdBy: json['createdBy'] ?? '',
      modifiedBy: json['modifiedBy'] ?? '',
    );
  }
}
