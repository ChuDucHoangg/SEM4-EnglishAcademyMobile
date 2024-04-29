import 'dart:convert';
import 'package:english_academy_mobile/presentation/auth/login_screen/login_screen.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../init_screen.dart';
import 'api_constants.dart';

class AuthService {
  static Future<void> loginWithEmail(
      String email, String password, BuildContext context) async {
    try {
      final Map<String, dynamic> body = {
        'email': email.trim(),
        'password': password,
      };

      final response = await http.post(
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.loginStudent}'),
        body: json.encode(body),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final token = json.decode(response.body)['token'];
        await _saveTokenToSharedPreferences(token);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => InitScreen()),
        );
        // print(token);
      } else if (response.statusCode == 400) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String errorMessage = responseData['message'];
        throw Exception(
            "Failed to login: ${response.statusCode}, $errorMessage");
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> registerWithEmail(
      String fullname, String email, String password, BuildContext context) async {
    try {
      final Map<String, dynamic> body = {
        'fullname': fullname.trim(),
        'email': email.trim(),
        'password': password,
      };

      final response = await http.post(
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.registerStudent}'),
        body: json.encode(body),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // print(data);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } else if (response.statusCode == 400) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String errorMessage = responseData['message'];
        throw Exception(
            "Failed to register: ${response.statusCode}, $errorMessage");
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> _saveTokenToSharedPreferences(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if (token != null) {
      return token;
    }
    throw Exception('Token not found');
  }

  static Future<int> getUserIdFromToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if (token != null) {
      final Map<String, dynamic> tokenData = json.decode(
          ascii.decode(base64.decode(base64.normalize(token.split(".")[1])))
      );
      return tokenData['Id'];
    }
    throw Exception('Token not found');
  }
}
