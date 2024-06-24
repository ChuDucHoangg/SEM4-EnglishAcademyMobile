import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../data/model/profileModel.dart';
import 'api_constants.dart';
import '../../service/AuthService.dart';

class ProfileService {
  static Future<ProfileModel> fetchProfileDetail() async {
    final String token = await AuthService.getToken();
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.profile}'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final dynamic profileJson = json.decode(utf8.decode(response.bodyBytes))['data'];
      return ProfileModel.fromJson(profileJson);
    } else {
      throw Exception('Failed to load profile detail');
    }
  }

  static Future<void> updateField(String field, String value, BuildContext context) async {
    try {
      final String token = await AuthService.getToken();
      final Map<String, dynamic> body = {
        field: value,
      };

      final response = await http.put(
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.updateProfile}'),
        body: json.encode(body),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Changed successfully')),
        );
      } else {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        if (response.statusCode == 400) {
          final Map<String, dynamic> responseData = json.decode(response.body);
          final String errorMessage = responseData['message'];
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to change: $errorMessage')),
          );
        }
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }
}
