import 'dart:convert';
import 'package:english_academy_mobile/service/api_constants.dart';
import 'package:http/http.dart' as http;
import '../../data/model/EntranceTestModel.dart';
import 'AuthService.dart';

class EntranceTestService {
  // Entrance Test Detail (Test Input)
  static Future<List<TestInputModel>> fetchEntranceTest() async {
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.entranceTest}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> entranceTestJson = json.decode(utf8.decode(response.bodyBytes))['data'];
      return entranceTestJson.map((json) => TestInputModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load entrance test.');
    }
  }

  // Entrance Test Detail (Test Input Detail)
  static Future<TestInputDetailModel> fetchEntranceTestDetail(String slug) async {
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.entranceTestDetail}/$slug'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final dynamic testJson = json.decode(utf8.decode(response.bodyBytes))['data'];
      return TestInputDetailModel.fromJson(testJson);
    } else {
      throw Exception('Failed to load test.');
    }
  }

  // Learning Path
  static Future<LearningPathModel> fetchLearningPaths(String code) async {
    final String token = await AuthService.getToken();
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.learningPaths}/$code'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      final dynamic learningPathJson = json.decode(utf8.decode(response.bodyBytes))['data'];
      return LearningPathModel.fromJson(learningPathJson);
    } else {
      throw Exception('Failed to load learning paths.');
    }
  }

  // Answer Detail
  static Future<List<AnswersDetailModel>> fetchAnswerDetail(String code) async {
    print('Code Answer Detail: $code');
    final String token = await AuthService.getToken();
    final response = await http.get(
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.answersDetail}/$code'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
    );

    if (response.statusCode == 200) {
      final List<dynamic> AnswerDetailJson = json.decode(utf8.decode(response.bodyBytes))['data'];
      return AnswerDetailJson.map((json) => AnswersDetailModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load entrance test.');
    }
  }
}

