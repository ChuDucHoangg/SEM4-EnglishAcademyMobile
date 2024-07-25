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

  static Future<List<StudentPackageDTO>> fetchBookingWaitingList() async {
    final String token = await AuthService.getToken();
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.bookingWaiting}'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> bookingWaitingsJson =
          json.decode(utf8.decode(response.bodyBytes))['data']
              ['studentPackageDTOS'];
      return bookingWaitingsJson
          .map((json) => StudentPackageDTO.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load bookings waiting');
    }
  }

  static Future<StudentPackageDTO> fetchBookingWaitingDetail(int id) async {
    final String token = await AuthService.getToken();
    final response = await http.get(
      Uri.parse(
          '${ApiConstants.baseUrl}${ApiConstants.bookingWaitingDetail}/$id'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final dynamic bookingWaitingJson =
          json.decode(utf8.decode(response.bodyBytes))['data'];
      return StudentPackageDTO.fromJson(bookingWaitingJson);
    } else {
      throw Exception('Failed to load booking waiting detail');
    }
  }

  static Future<void> paymentBookingWaiting(
      int bookingId, String paymentMethod, double price) async {
    final String token = await AuthService.getToken();
    try {
      final Map<String, dynamic> body = {
        "bookingType": 1,
        "id": bookingId,
        "paymentMethod": paymentMethod,
        "price": price
      };

      final response = await http.post(
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.paymentBooking}'),
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
}
