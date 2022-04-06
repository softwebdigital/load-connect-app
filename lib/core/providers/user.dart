import 'package:flutter/foundation.dart' show debugPrint;

import '../models/http_result.dart';
import '../services/http_service.dart';

class UserProvider {
  final HttpService _httpService = HttpService();

  Future<HttpResult> getUserProfile() async {
    try {
      debugPrint('Running: GET USER PROFILE');
      return HttpResult.fromMap(await _httpService.get(
        "/user",
        useAuth: true,
      ));
    } catch (e) {
      debugPrint("$e");
      rethrow;
    }
  }

  // Future<HttpResult> signupUser(Map<String, dynamic> data) async {
  //   try {
  //     return HttpResult.fromMap(await _httpService.send(
  //       "/auth/register",
  //       HttpType.post,
  //       body: {
  //         "first_name": data['fname'],
  //         "last_name": data['lname'],
  //         "email": data['email'],
  //         "phone_number": data['phone'],
  //         "password": data['password'],
  //         "user_type": "user"
  //       },
  //     ));
  //   } catch (e) {
  //     debugPrint("$e");
  //     rethrow;
  //   }
  // }
}
