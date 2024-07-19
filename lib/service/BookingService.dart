import 'dart:convert';
import 'package:english_academy_mobile/data/model/BookingModel.dart';
import 'package:http/http.dart' as http;
import 'AuthService.dart';
import 'api_constants.dart';

class BookingService {
  static Future<List<BookingModel>> fetchBookingList() async {
    final String token = await AuthService.getToken();
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.bookingList}'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> bookingsJson =
          json.decode(utf8.decode(response.bodyBytes))['data'];
      return bookingsJson.map((json) => BookingModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load bookings');
    }
  }

  static Future<BookingModel> fetchBookingDetail(int id) async {
    final String token = await AuthService.getToken();
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.bookingDetail}/$id'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final dynamic bookingJson =
          json.decode(utf8.decode(response.bodyBytes))['data'];
      return BookingModel.fromJson(bookingJson);
    } else {
      throw Exception('Failed to load booking detail');
    }
  }

  static Future<bool> checkRoomCode(String roomCode) async {
    final String token = await AuthService.getToken();
    final response = await http.get(
      Uri.parse(
          '${ApiConstants.baseUrl}${ApiConstants.checkStudent}/$roomCode'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      return responseBody['status'];
    } else {
      throw Exception('Failed to check room code');
    }
  }
}
