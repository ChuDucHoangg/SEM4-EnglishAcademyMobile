class TutorModel {
  final int id;
  final String fullname;
  final String code;
  final int phone;
  final int level;
  final String avatar;
  final String address;
  final String cetificate;
  final String experience;
  final String teachingSubject;
  final double hourlyRate;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final String createdBy;
  final String modifiedBy;

  TutorModel({
    required this.id,
    required this.fullname,
    required this.code,
    required this.phone,
    required this.level,
    required this.avatar,
    required this.address,
    required this.cetificate,
    required this.experience,
    required this.teachingSubject,
    required this.hourlyRate,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  factory TutorModel.fromJson(Map<String, dynamic> json) {
    return TutorModel(
      id: json['id'] ?? 0,
      fullname: json['fullname'] ?? '',
      code: json['code'] ?? '',
      phone: json['level'] ?? 0,
      level: json['level'] ?? 0,
      avatar: json['avatar'] ?? '',
      address: json['address'] ?? '',
      cetificate: json['cetificate'] ?? '',
      experience: json['experience'] ?? '',
      teachingSubject: json['teachingSubject'] ?? '',
      hourlyRate: json['hourlyRate']?.toDouble() ?? 0.0,
      createdDate: json['createdDate'] != null
          ? DateTime.parse(json['createdDate'])
          : DateTime.now(),
      modifiedDate: json['modifiedDate'] != null
          ? DateTime.parse(json['modifiedDate'])
          : DateTime.now(),
      createdBy: json['createdBy'] ?? '',
      modifiedBy: json['modifiedBy'] ?? '',
    );
  }
}

class PackageTutorModel {
  final int id;
  final String name;
  final String description;
  final int numSessions;
  final double hourlyRate;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final String createdBy;
  final String modifiedBy;

  PackageTutorModel({
    required this.id,
    required this.name,
    required this.description,
    required this.numSessions,
    required this.hourlyRate,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  factory PackageTutorModel.fromJson(Map<String, dynamic> json) {
    return PackageTutorModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      numSessions: json['numSessions'] ?? 0,
      hourlyRate: json['hourlyRate']?.toDouble() ?? 0.0,
      createdDate: json['createdDate'] != null
          ? DateTime.parse(json['createdDate'])
          : DateTime.now(),
      modifiedDate: json['modifiedDate'] != null
          ? DateTime.parse(json['modifiedDate'])
          : DateTime.now(),
      createdBy: json['createdBy'] ?? '',
      modifiedBy: json['modifiedBy'] ?? '',
    );
  }
}

class AvailabilityTutorModel {
  final int id;
  final int tutorId;
  final String tutorName;
  final String startTime;
  final String endTime;
  final String dayOfWeek;
  final bool status;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final String createdBy;
  final String modifiedBy;

  AvailabilityTutorModel({
    required this.id,
    required this.tutorId,
    required this.tutorName,
    required this.startTime,
    required this.endTime,
    required this.dayOfWeek,
    required this.status,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  factory AvailabilityTutorModel.fromJson(Map<String, dynamic> json) {
    return AvailabilityTutorModel(
      id: json['id'] ?? 0,
      tutorId: json['tutorId'] ?? 0,
      tutorName: json['tutorName'] ?? '',
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
      dayOfWeek: json['dayOfWeek'] ?? '',
      status: json['status'] ?? '',
      createdDate: json['createdDate'] != null
          ? DateTime.parse(json['createdDate'])
          : DateTime.now(),
      modifiedDate: json['modifiedDate'] != null
          ? DateTime.parse(json['modifiedDate'])
          : DateTime.now(),
      createdBy: json['createdBy'] ?? '',
      modifiedBy: json['modifiedBy'] ?? '',
    );
  }
}
