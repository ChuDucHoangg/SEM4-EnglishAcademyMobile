import 'dart:convert';
import 'package:english_academy_mobile/data/model/ItemModel.dart';
import 'package:english_academy_mobile/data/model/TopicModel.dart';
import 'package:http/http.dart' as http;
import '../data/model/CourseModel.dart';
import 'AuthService.dart';
import 'api_constants.dart';

class CourseService {
  static Future<List<CourseModel>> fetchCourses() async {
    final response = await http
        .get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.courseOnline}'));

    if (response.statusCode == 200) {
      final List<dynamic> coursesJson =
          json.decode(utf8.decode(response.bodyBytes))['data'];
      return coursesJson.map((json) => CourseModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }

  static Future<CourseModel> fetchCourseDetail(String slug) async {
    final response = await http.get(
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.courseDetail}/$slug'));

    if (response.statusCode == 200) {
      final dynamic courseJson =
          json.decode(utf8.decode(response.bodyBytes))['data'];
      return CourseModel.fromJson(courseJson);
    } else {
      throw Exception('Failed to load course detail');
    }
  }

  static Future<TopicModel> fetchTopicDetail(String slug) async {
    final int userId = await AuthService.getUserIdFromToken();
    final String token = await AuthService.getToken();
    final response = await http.get(
      Uri.parse(
          '${ApiConstants.baseUrl}${ApiConstants.topicOnline}/$slug/$userId'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final dynamic topicJson =
          json.decode(utf8.decode(response.bodyBytes))['data'];
      return TopicModel.fromJson(topicJson);
    } else {
      throw Exception(
          "Failed to load topic detail: ${response.body}");
    }
  }

  static Future<ItemModel> fetchItemDetail(String slug) async {
    final String token = await AuthService.getToken();
    final response = await http.get(
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.itemOnline}/$slug'),
      headers: {
        'Authorization': 'Bearer $token',
      },);

    if (response.statusCode == 200) {
      final dynamic topicJson =
          json.decode(utf8.decode(response.bodyBytes))['data'];
      return ItemModel.fromJson(topicJson);
    } else {
      throw Exception('Failed to load item detail');
    }
  }

  static Future<void> markLessonAsComplete(String slug) async {
    final String token = await AuthService.getToken();
    final response = await http.put(
      Uri.parse(
          '${ApiConstants.baseUrl}${ApiConstants.itemOnline}/$slug'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      // await fetchTopicDetail(slug);
    } else {
      throw Exception('Failed to mark lesson as complete');
    }
  }

  static Future<void> buyCourse(int courseId, String paymentMethod) async {
    final int userId = await AuthService.getUserIdFromToken();
    final String token = await AuthService.getToken();
    try {
      final Map<String, dynamic> body = {
        "studentId": userId,
        "courseOnlineId": courseId,
        "paymentMethod": paymentMethod
      };

      final response = await http.post(
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.buyCourse}'),
        body: json.encode(body),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
        print("Payment data sent successfully");
      } else {
        throw Exception("Failed to send payment data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to send payment data: $e");
    }
  }

  static Future<bool> checkCourseStudent(String slug) async {
    final String token = await AuthService.getToken();
    final response = await http.get(
        Uri.parse(
            '${ApiConstants.baseUrl}${ApiConstants.checkCourseStudent}/$slug'),
        headers: {
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      final dynamic data = json.decode(utf8.decode(response.bodyBytes))['data'];
      return data;
    } else {
      throw Exception(
          "Failed to check course student: ${response.body}");
    }
  }
}
