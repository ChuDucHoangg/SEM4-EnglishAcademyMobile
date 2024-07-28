import 'dart:convert';
import 'package:english_academy_mobile/presentation/auth/login_screen/login_screen.dart';
import 'package:http/http.dart' as http;

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

  static Future<void> changePassword(String currentPassword, String newPassword,
      String confirmPassword, BuildContext context) async {
    try {
      final String? token = await getToken();

      if (token == null) {
        throw Exception('Token not found');
      }

      final Map<String, dynamic> body = {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
        'confirmPassword': confirmPassword,
      };

      final response = await http.post(
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.changePassword}'),
        body: json.encode(body),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password changed successfully')),
        );
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (Route<dynamic> route) => false,
        );
      } else if (response.statusCode == 400) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String errorMessage = responseData['message'];
        throw Exception(
            "Failed to change password: ${response.statusCode}, $errorMessage");
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> registerWithEmail(String fullname, String phone, String email,
      String password, BuildContext context) async {
    try {
      final Map<String, dynamic> body = {
        'fullname': fullname.trim(),
        'phone': phone.trim(),
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
        // final data = json.decode(response.body);
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

  static Future<void> removeTokenFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }

  static Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if (token != null && token.isNotEmpty) {
      return token;
    }
    throw Exception('Token not found');
  }

  static Future<int> getUserIdFromToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if (token != null) {
      final List<String> parts = token.split(".");
      final String normalizedToken = base64Url.normalize(parts[1]);
      final String decodedToken = utf8.decode(base64Url.decode(normalizedToken));

      final Map<String, dynamic> tokenData = json.decode(decodedToken);
      return tokenData['Id'];
    }
    throw Exception('Token not found');
  }
}
