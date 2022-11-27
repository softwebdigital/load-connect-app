

import 'package:dio/src/form_data.dart';
import 'package:load_connect/backend/models/core/service_response.dart';
import 'package:load_connect/backend/models/entities/user_load.dart';
import 'package:load_connect/backend/repositories/api/core/api_service.dart';
import 'package:load_connect/backend/repositories/api/core/endpoints.dart';
import 'package:load_connect/backend/services/i_load_service.dart';

class ApiLoadService implements ILoadService {

  final apiService = ApiService();

  @override
  Future<ServiceResponse> createLoad(FormData request) async {
    try {
      // final apiService = ApiService.createInstance();
      final res = await apiService.makePostRequest(createLoadEndpoint, request, {
        'Content-Type': 'application/x-www-form-urlencoded'
      }, useFormData: false);
      print("Response: ${res.toJson()}");
      return ServiceResponse(
          status: res.status,
          message: res.message,
          data: res.data != null ? res.data['data'] : null
      );

    } catch (error) {
      // rethrow;
      return ServiceResponse(data: null, message: "Error: $error", status: false);
    }
  }

  @override
  Future<ServiceResponse<List<UserLoad>>> getUserLoads() async {
    try {
      final res = await apiService.makeGetRequest(getSenderLoadEndpoint, {
        'Content-Type': 'application/json',
        "Accept": 'application/json'
      });
      print("ApiRes: ${res.toJson()}");
      return ServiceResponse(
          status: true,
          message: "Returned",
          data: res.data == null ? null : List.from(res.data['data']).map((e) => UserLoad.fromJson(e)).toList()
      );
    } catch (error) {
      return ServiceResponse(
          status: false,
          data: null,
          message: "Error occurred"
      );
    }
  }

  @override
  Future<ServiceResponse<String>> acceptOffer(String loadId) async {
    try {
      final res = await apiService.makePutRequest(acceptOfferEndpoint(loadId), {
        "offer_action": "accept"
      }, {
        'Content-Type': 'application/json',
        "Accept": 'application/json'
      });
      if (res.status == true) {
        return ServiceResponse(
            status: true,
            message: res.message,
            data: res.message
        );
      }
      return ServiceResponse(
        status: res.status,
        message: res.message,
        data: res.message
      );
    } catch (error) {
      return ServiceResponse(
          status: false,
          data: null,
          message: "Error occurred"
      );
    }
  }

  @override
  Future<ServiceResponse<String>> declineOffer(String loadId) async {
    try {
      final res = await apiService.makePutRequest(declineOfferEndpoint(loadId), {
        "offer_action": "reject"
      }, {
        'Content-Type': 'application/json',
        "Accept": 'application/json'
      });
      if (res.status == true) {
        return ServiceResponse(
            status: true,
            message: res.message,
            data: res.message
        );
      }
      return ServiceResponse(
          status: res.status,
          message: res.message,
          data: res.message
      );
    } catch (error) {
      return ServiceResponse(
          status: false,
          data: null,
          message: "Error occurred"
      );
    }
  }

  @override
  Future<ServiceResponse<String>> negotiateOffer(String loadId, num amount) async {
    try {
      final res = await apiService.makePutRequest(negotiateOfferEndpoint(loadId), {
        "pricing_offer": amount
      }, {
        'Content-Type': 'application/json',
        "Accept": 'application/json'
      });
      if (res.status == true) {
        return ServiceResponse(
            status: true,
            message: res.message,
            data: res.message
        );
      }
      return ServiceResponse(
          status: res.status,
          message: res.message,
          data: res.message
      );
    } catch (error) {
      return ServiceResponse(
          status: false,
          data: null,
          message: "Error occurred"
      );
    }
  }

  @override
  Future<ServiceResponse<UserLoad>> getLoad(String loadId) async {
    try {
      final res = await apiService.makeGetRequest(getLoadEndpoint(loadId), {
        'Content-Type': 'application/json',
        "Accept": 'application/json'
      });
      print("ApiRes: ${res.toJson()}");
      return ServiceResponse(
          status: true,
          message: "Returned",
          data: res.data == null ? null : UserLoad.fromJson(res.data['data'])
      );
    } catch (error) {
      return ServiceResponse(
          status: false,
          data: null,
          message: "Error occurred"
      );
    }
  }

}