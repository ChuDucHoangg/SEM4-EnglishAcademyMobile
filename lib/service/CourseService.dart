import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data/model/CourseModel.dart';
import 'api_constants.dart';

class CourseService {
  static Future<List<CourseModel>> fetchCourses() async {
    final response = await http.get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.courseOnline}'));

    if (response.statusCode == 200) {
      final List<dynamic> coursesJson = json.decode(response.body)['data'];
      return coursesJson.map((json) => CourseModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }
}
