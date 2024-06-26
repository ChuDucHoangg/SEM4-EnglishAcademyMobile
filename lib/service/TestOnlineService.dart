import 'dart:convert';
import 'package:english_academy_mobile/data/model/TestOnlineModel.dart';
import 'package:english_academy_mobile/service/api_constants.dart';
import 'package:http/http.dart' as http;

import 'AuthService.dart';

class TestOnlineService {
  static Future<TestOnlineModel> fetchTestOnline(String slug) async {
    final String token = await AuthService.getToken();
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.testOnline}/$slug'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print('${ApiConstants.baseUrl}${ApiConstants.testOnline}/$slug');
    if (response.statusCode == 200) {
      final dynamic testJson =
          json.decode(utf8.decode(response.bodyBytes))['data'];
      // print('${testJson}');
      return TestOnlineModel.fromJson(testJson);
    } else {
      throw Exception('Failed to load test.');
    }
  }

  static Future<TestOnlineResult> fetchResultTestOnline(String slug) async {
    final String token = await AuthService.getToken();
    final response = await http.get(
      Uri.parse(
          '${ApiConstants.baseUrl}${ApiConstants.resultTestOnline}/$slug'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final dynamic resultTestJson =
          json.decode(utf8.decode(response.bodyBytes))['data'];
      // print('${resultTestJson}');
      return TestOnlineResult.fromJson(resultTestJson);
    } else {
      throw Exception('Failed to load result test.');
    }
  }
}
