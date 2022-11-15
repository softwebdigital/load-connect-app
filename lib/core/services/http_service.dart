import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../shared/constants.dart';

class HttpService {
  final String _baseUrl = AppData.apiUrl;
  Future<Map<String, dynamic>> get(
    String url, {
    Map<String, String>? headers,
    bool useAuth = false,
  }) async {
    try {
      if (useAuth) {
        headers?.addAll({'authorization': 'Bearer token'});
      }
      final response =
          await http.get(Uri.parse("$_baseUrl/url"), headers: headers);
      return jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }
}
