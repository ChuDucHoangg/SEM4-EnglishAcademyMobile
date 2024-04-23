import 'dart:convert';
import 'package:english_academy_mobile/data/model/CourseOfflineModel.dart';
import 'package:english_academy_mobile/data/model/ItemOfflineModel.dart';
import 'package:english_academy_mobile/data/model/SubjectOfflineModel.dart';
import 'package:http/http.dart' as http;
import 'api_constants.dart';

class CourseOfflineService {
  static Future<List<CourseOfflineModel>> fetchCoursesOffline() async {
    final int UserId = 1;
    final response = await http.get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.courseOfflineStudent}/$UserId'));

    if (response.statusCode == 200) {
      final List<dynamic> coursesJson = json.decode(utf8.decode(response.bodyBytes))['data'];
      return coursesJson.map((json) => CourseOfflineModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }

  static Future<CourseOfflineModel> fetchCourseOfflineDetail(String slug) async {
    final int UserId = 1;
    final response = await http.get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.courseOfflineDetailStudent}/$slug/$UserId'));

    if (response.statusCode == 200) {
      final dynamic courseJson = json.decode(utf8.decode(response.bodyBytes))['data'];
      return CourseOfflineModel.fromJson(courseJson);
    } else {
      throw Exception('Failed to load course detail');
    }
  }

  static Future<SubjectOfflineModel> fetchSubjectOfflineDetail(String slug) async {
    final int UserId = 1;
    final response = await http.get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.courseOfflineSubjectDetailStudent}/$slug/$UserId'));

    if (response.statusCode == 200) {
      final dynamic subjectJson = json.decode(utf8.decode(response.bodyBytes))['data'];
      return SubjectOfflineModel.fromJson(subjectJson);
    } else {
      throw Exception('Failed to load subject detail');
    }
  }

  static Future<ItemOfflineModel> fetchItemSlotOfflineDetail(String slug) async {
    final int UserId = 1;
    final response = await http.get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.courseOfflineItemSlotStudent}/$slug/$UserId'));

    if (response.statusCode == 200) {
      final dynamic itemJson = json.decode(utf8.decode(response.bodyBytes))['data'];
      return ItemOfflineModel.fromJson(itemJson);
    } else {
      throw Exception('Failed to load item detail');
    }
  }

  static Future<void> createAnswerItemSlotStudent(int itemSlotId, String content) async {
    try {
      final Map<String, dynamic> body = {
        "itemSlotId": itemSlotId,
        "content": content,
      };

      final response = await http.post(
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.createAnswerItemSlotStudent}'),
        body: json.encode(body),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        print("Answer data sent successfully");
      } else {
        throw Exception("Failed to send answer data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to send answer data: $e");
    }
  }
}

