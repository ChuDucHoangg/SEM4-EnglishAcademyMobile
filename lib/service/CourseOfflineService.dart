import 'dart:convert';
import 'package:english_academy_mobile/data/model/CourseOfflineModel.dart';
import 'package:english_academy_mobile/data/model/ItemOfflineModel.dart';
import 'package:english_academy_mobile/data/model/SubjectOfflineModel.dart';
import 'package:http/http.dart' as http;
import 'AuthService.dart';
import 'api_constants.dart';

class CourseOfflineService {
  static Future<List<CourseOfflineModel>> fetchCoursesOffline() async {
    final String token = await AuthService.getToken();
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.courseOfflineStudent}'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> coursesJson =
          json.decode(utf8.decode(response.bodyBytes))['data'];
      return coursesJson
          .map((json) => CourseOfflineModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load courses: ${response.body}');
    }
  }

  static Future<CourseOfflineModel> fetchCourseOfflineDetail(
      String slug) async {
    final String token = await AuthService.getToken();
    final response = await http.get(
      Uri.parse(
          '${ApiConstants.baseUrl}${ApiConstants.courseOfflineDetailStudent}/$slug'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final dynamic courseJson =
          json.decode(utf8.decode(response.bodyBytes))['data'];
      return CourseOfflineModel.fromJson(courseJson);
    } else {
      throw Exception('Failed to load course detail: ${response.body}');
    }
  }

  static Future<SubjectOfflineModel> fetchSubjectOfflineDetail(
      String slug) async {
    final String token = await AuthService.getToken();
    final response = await http.get(
      Uri.parse(
          '${ApiConstants.baseUrl}${ApiConstants.courseOfflineSubjectDetailStudent}/$slug'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final dynamic subjectJson =
          json.decode(utf8.decode(response.bodyBytes))['data'];
      return SubjectOfflineModel.fromJson(subjectJson);
    } else {
      throw Exception('Failed to load subject detail: ${response.body}');
    }
  }

  static Stream<ItemOfflineModel> fetchItemSlotOfflineDetailStream(String slug) async* {
    final String token = await AuthService.getToken();
    while (true) {
      try {
        final response = await http.get(
          Uri.parse('${ApiConstants.baseUrl}${ApiConstants.courseOfflineItemSlotStudent}/$slug'),
          headers: {'Authorization': 'Bearer $token'},
        );
        if (response.statusCode == 200) {
          final dynamic itemJson = json.decode(utf8.decode(response.bodyBytes))['data'];
          yield ItemOfflineModel.fromJson(itemJson);
        } else {
          throw Exception('Failed to load item detail: ${response.body}');
        }
      } catch (e) {
        // print('Error: $e');
        // yield* Stream.error(e);
      }
      await Future.delayed(Duration(milliseconds: 10));
    }
  }


  static Future<void> createAnswerItemSlotStudent(
      int itemSlotId, String content) async {
    try {
      final Map<String, dynamic> body = {
        "itemSlotId": itemSlotId,
        "content": content,
      };
      final String token = await AuthService.getToken();

      final response = await http.post(
        Uri.parse(
            '${ApiConstants.baseUrl}${ApiConstants.createAnswerItemSlotStudent}'),
        body: json.encode(body),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token'
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

  static Stream<ListScoreModel> fetchListScoreStudentStream(String slug) async* {
    final String token = await AuthService.getToken();
    while (true) {
      try {
        final response = await http.get(
          Uri.parse('${ApiConstants.baseUrl}${ApiConstants.listScoreItemSlotStudent}/$slug'),
          headers: {'Authorization': 'Bearer $token'},
        );
        if (response.statusCode == 200) {
          final dynamic listScoreJson = json.decode(utf8.decode(response.bodyBytes))['data'];
          yield ListScoreModel.fromJson(listScoreJson);
        } else {
          throw Exception('Failed to load list score: ${response.body}');
        }
      } catch (e) {
        // print('Error: $e');
        yield* Stream.error(e);
      }
      await Future.delayed(Duration(milliseconds: 1000));
    }
  }

  static Future<void> voteScoreStudent(
      int answerStudentItemSlotId, int star) async {
    try {
      final Map<String, dynamic> body = {
        "answerStudentItemSlotId": answerStudentItemSlotId,
        "star": star,
      };
      final String token = await AuthService.getToken();
      final response = await http.put(
        Uri.parse(
            '${ApiConstants.baseUrl}${ApiConstants.voteScoreItemSlotStudent}'),
        body: json.encode(body),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
        print("Vote data sent successfully");
      } else {
        throw Exception("Failed to vote answer data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to vote answer data: $e");
    }
  }
}
