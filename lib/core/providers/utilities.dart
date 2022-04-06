import 'package:flutter/foundation.dart';

import '../models/http_result.dart';
import '../services/http_service.dart';

class UtilProvider {
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
}
