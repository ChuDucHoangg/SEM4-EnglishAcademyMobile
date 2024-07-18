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
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> lessonDays = [];
    List<dynamic> lessionBookingDTOS = [];

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
