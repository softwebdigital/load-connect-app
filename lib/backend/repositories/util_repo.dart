import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:load_connect/backend/models/dtos/http_result.dart';
import 'package:load_connect/backend/models/entities/address_result.dart';
import 'package:load_connect/backend/models/entities/prediction_result.dart';
import 'package:load_connect/shared/constants.dart';

class UtilRepo extends GetxService {
  Future<UtilRepo> init() async {
    // await 1.delay();
    debugPrint('$runtimeType ready!');
    return this;
  }

  Future<HttpResult<List<PredictionResult>>> searchGooglePlaces(
      String query, {
        String? token,
      }) async {
    final sessionToken = token ?? "ran_90_sess\$_";
    try {
      final uri = Uri.parse(
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&key=${AppData.googleMapsApiKey}&sessiontoken=$sessionToken&components=country:ng",
      );
      final response = await http.get(uri);
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      debugPrint("$body");
      if (body['status'] == "OK") {
        final predictions = body['predictions'] as List<dynamic>;
        final results = predictions
            .map(
              (e) => PredictionResult.fromMap(e),
        )
            .toList();
        return HttpResult<List<PredictionResult>>(
          true,
          "Available predictions",
          data: results,
        );
      }
      return HttpResult(false, "Unable to fetch predictions");
    } catch (e) {
      debugPrint("$e");
      rethrow;
    }
  }

  Future<HttpResult<AddressResult>> findPlaceDetails(
      String placeId, {
        String? token,
      }) async {
    final sessionToken = token ?? "ran_90_sess\$_";
    try {
      final uri = Uri.parse(
        "https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeId&key=${AppData.googleMapsApiKey}&sessiontoken=$sessionToken",
      );
      final response = await http.get(uri);
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      // debugPrint("$body");
      if (body['status'] == "OK") {
        final addrDetails = body['result'] as Map<String, dynamic>;
        if (addrDetails.containsKey("formatted_address")) {
          final results = AddressResult.fromMap(addrDetails);
          return HttpResult<AddressResult>(
            true,
            "Available address details",
            data: results,
          );
        }
      }
      return HttpResult(false, "Unable to fetch address details");
    } catch (e) {
      debugPrint("$e");
      rethrow;
    }
  }
}