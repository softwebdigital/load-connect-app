import 'package:flutter/foundation.dart';

import '../models/http_result.dart';
import '../services/http_service.dart';

class AuthProvider {
  final HttpService _httpService = HttpService();

  Future<HttpResult> loginUser(String email, String password) async {
    try {
      return HttpResult.fromMap(await _httpService.send(
        "/auth/login",
        HttpType.patch,
        body: {
          "user_id": email,
          "password": password,
          "firebase_token": "dydhdydjmd===djhd65yrjhdbdd"
        },
      ));
    } catch (e) {
      debugPrint("$e");
      rethrow;
    }
  }

  Future<HttpResult> signupUser(Map<String, dynamic> data) async {
    try {
      return HttpResult.fromMap(await _httpService.send(
        "/auth/register",
        HttpType.post,
        body: {
          "first_name": data['fname'],
          "last_name": data['lname'],
          "email": data['email'],
          "phone_number": data['phone'],
          "password": data['password'],
          "user_type": "user"
        },
      ));
    } catch (e) {
      debugPrint("$e");
      rethrow;
    }
  }

  Future<HttpResult> generateToken(userId, String type) async {
    try {
      return HttpResult.fromMap(await _httpService.send(
        "/auth/generate_token",
        HttpType.post,
        body: {"user_id": userId, "type": type},
      ));
    } catch (e) {
      debugPrint("$e");
      rethrow;
    }
  }

  Future<HttpResult> verifyToken(userId, String token) async {
    try {
      return HttpResult.fromMap(await _httpService.send(
        "/auth/verify",
        HttpType.patch,
        body: {"user_id": userId, "token": token},
      ));
    } catch (e) {
      debugPrint("$e");
      rethrow;
    }
  }

  Future<HttpResult> forgotPassword(String emailOrPhone) async {
    try {
      return HttpResult.fromMap(await _httpService.send(
        "/auth/forget",
        HttpType.patch,
        body: {"email": emailOrPhone},
      ));
    } catch (e) {
      debugPrint("$e");
      rethrow;
    }
  }

  Future<HttpResult> resetPassword(userId, String password) async {
    try {
      return HttpResult.fromMap(await _httpService.send(
        "/auth/reset",
        HttpType.patch,
        body: {
          "user_id": userId,
          "password": password,
        },
      ));
    } catch (e) {
      debugPrint("$e");
      rethrow;
    }
  }
}
