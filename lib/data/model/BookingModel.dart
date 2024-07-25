import 'dart:convert';

class BookingModel {
  final int id;
  final int tutorId;
  final int studentId;
  final int paymentId;
  final String startTime;
  final String endTime;
  final String tutorName;
  final String studentName;
  final String description;
  final String status;
  final List<dynamic> lessonDays;
  final List<dynamic> lessionBookingDTOS;
  final List<StudentPackageDTO> studentPackageDTOS;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final String createdBy;
  final String modifiedBy;

  BookingModel({
    required this.id,
    required this.tutorId,
    required this.studentId,
    required this.paymentId,
    required this.startTime,
    required this.endTime,
    required this.tutorName,
    required this.studentName,
    required this.description,
    required this.status,
    required this.lessonDays,
    required this.lessionBookingDTOS,
    required this.studentPackageDTOS,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> lessonDays = [];
    List<dynamic> lessionBookingDTOS = [];
    List<StudentPackageDTO> studentPackageDTOS = [];

    if (json['lessonDays'] is String) {
      lessonDays = jsonDecode(json['lessonDays']);
    } else if (json['lessonDays'] is List) {
      lessonDays = json['lessonDays'];
    }

    if (json['lessionBookingDTOS'] is String) {
      lessionBookingDTOS = jsonDecode(json['lessionBookingDTOS']);
    } else if (json['lessionBookingDTOS'] is List) {
      lessionBookingDTOS = json['lessionBookingDTOS'];
    }

    if (json['studentPackageDTOS'] is String) {
      studentPackageDTOS = (jsonDecode(json['studentPackageDTOS']) as List)
          .map((item) => StudentPackageDTO.fromJson(item))
          .toList();
    } else if (json['studentPackageDTOS'] is List) {
      studentPackageDTOS = (json['studentPackageDTOS'] as List)
          .map((item) => StudentPackageDTO.fromJson(item))
          .toList();
    }

    return BookingModel(
      id: json['id'] ?? 0,
      tutorId: json['tutorId'] ?? 0,
      studentId: json['studentId'] ?? 0,
      paymentId: json['paymentId'] ?? 0,
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
      tutorName: json['tutorName'] ?? '',
      studentName: json['studentName'] ?? '',
      description: json['description'] ?? '',
      status: json['status'] ?? '',
      lessonDays: lessonDays,
      lessionBookingDTOS: lessionBookingDTOS,
      studentPackageDTOS: studentPackageDTOS,
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

class StudentPackageDTO {
  final int id;
  final int packageId;
  final String packageName;
  final double packagePrice;
  final int studentId;
  final String studentName;
  final int remainingSessions;
  final String purchaseDate;
  final List<dynamic> lessonDays;
  final String status;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final String? createdBy;
  final String? modifiedBy;

  StudentPackageDTO({
    required this.id,
    required this.packageId,
    required this.packageName,
    required this.packagePrice,
    required this.studentId,
    required this.studentName,
    required this.remainingSessions,
    required this.purchaseDate,
    required this.lessonDays,
    required this.status,
    this.createdDate,
    this.modifiedDate,
    this.createdBy,
    this.modifiedBy,
  });

  factory StudentPackageDTO.fromJson(Map<String, dynamic> json) {
    List<dynamic> lessonDays = [];

    if (json['lessonDays'] is String) {
      lessonDays = jsonDecode(json['lessonDays']);
    } else if (json['lessonDays'] is List) {
      lessonDays = json['lessonDays'];
    }
    return StudentPackageDTO(
      id: json['id'] ?? 0,
      packageId: json['packageId'] ?? 0,
      packageName: json['packageName'] ?? '',
      packagePrice: json['packagePrice'].toDouble() ?? 0.0,
      studentId: json['studentId'] ?? 0,
      studentName: json['studentName'] ?? '',
      remainingSessions: json['remainingSessions'] ?? 0,
      purchaseDate: json['purchaseDate'] ?? '',
      lessonDays: lessonDays,
      status: json['status'] ?? '',
      createdDate: json['createdDate'] != null
          ? DateTime.parse(json['createdDate'])
          : null,
      modifiedDate: json['modifiedDate'] != null
          ? DateTime.parse(json['modifiedDate'])
          : null,
      createdBy: json['createdBy'],
      modifiedBy: json['modifiedBy'],
    );
  }
}

// class LessonDay {
//   final String startTime;
//   final String endTime;
//   final String dayOfWeek;
//
//   LessonDay({
//     required this.startTime,
//     required this.endTime,
//     required this.dayOfWeek,
//   });
//
//   factory LessonDay.fromJson(Map<String, dynamic> json) {
//     return LessonDay(
//       startTime: json['startTime'] ?? '',
//       endTime: json['endTime'] ?? '',
//       dayOfWeek: json['dayOfWeek'] ?? '',
//     );
//   }
// }
