import 'dart:convert';
import 'package:english_academy_mobile/data/model/TurtorModel.dart';
import 'package:http/http.dart' as http;
import 'AuthService.dart';
import 'api_constants.dart';

class TutorService {
  static Future<List<TutorModel>> fetchTutors() async {
    final response = await http
        .get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.tutorList}'));

    if (response.statusCode == 200) {
      final List<dynamic> tutorsJson =
          json.decode(utf8.decode(response.bodyBytes))['data'];
      return tutorsJson.map((json) => TutorModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load tutors');
    }
  }

  static Future<TutorModel> fetchTutorDetail(String code) async {
    final response = await http.get(
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.tutorDetail}/$code'));

    if (response.statusCode == 200) {
      final dynamic tutorJson =
          json.decode(utf8.decode(response.bodyBytes))['data'];
      return TutorModel.fromJson(tutorJson);
    } else {
      throw Exception('Failed to load tutor detail');
    }
  }

  static Future<List<PackageTutorModel>> fetchPackageTutor(String code) async {
    final response = await http.get(
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.packageTutor}/$code'));

    if (response.statusCode == 200) {
      final List<dynamic> packageTutorJsonList =
          json.decode(utf8.decode(response.bodyBytes))['data'];
      return packageTutorJsonList
          .map((json) => PackageTutorModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load package tutors');
    }
  }

  static Future<List<AvailabilityTutorModel>> fetchAvailabilityDetail(
      String code) async {
    final response = await http.get(Uri.parse(
        '${ApiConstants.baseUrl}${ApiConstants.availabilityTutor}/$code'));

    if (response.statusCode == 200) {
      final List<dynamic> availabilityTutorJson =
          json.decode(utf8.decode(response.bodyBytes))['data'];
      return availabilityTutorJson
          .map((json) => AvailabilityTutorModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load tutor availability');
    }
  }

  static Future<void> createBookingTutor(
      int typeBooking, int tutorId, int packageId, List<int> lessonDays) async {
    final String token = await AuthService.getToken();
    try {
      final Map<String, dynamic> body = {
        "typeBooking": typeBooking,
        "tutorId": tutorId,
        "packageId": packageId,
        "lessonDays": lessonDays,
        "description": "Test Message"
      };

      print('Request Body: ${json.encode(body)}');

      final response = await http.post(
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.createBooking}'),
        body: json.encode(body),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
      );

      print('Request Headers: ${json.encode({
            "Content-Type": "application/json",
            'Authorization': 'Bearer $token',
          })}');

      if (response.statusCode == 200) {
        print("Successfully data sent successfully");
      } else {
        final errorResponse = json.decode(response.body);
        print('Error Message: $errorResponse');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception("Failed to send data ex: $e");
    }
  }
}
