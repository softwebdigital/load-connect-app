

import 'package:load_connect/backend/models/core/service_response.dart';
import 'package:load_connect/backend/models/entities/vehicle_model.dart';
import 'package:load_connect/backend/services/i_truck_service.dart';

import '../../../../shared/constants.dart';
import '../core/api_service.dart';
import '../core/endpoints.dart';

class ApiTruckService implements ITruckService {

  final apiService = ApiService();

  @override
  Future<ServiceResponse<List<VehicleModel>>> getVehicles() async {
    try {
      final res = await apiService.makeGetRequest(getTruckEndpoint, {
        ...requireTokenHeader
      },);
      print("Response: ${res.toJson()}");
      if (res.status == true) {
        return ServiceResponse(
          status: res.status,
          message: res.message,
          data: List.from(res.data['data']).map((e) => VehicleModel.fromJson(e)).toList()
        );
      }
      return ServiceResponse(
          status: res.status,
          message: res.message,
          data: null
      );
    } catch (error) {
      // rethrow;
      return ServiceResponse(data: null, message: "Error $error", status: false);
    }
  }

  @override
  Future<ServiceResponse<String>> saveTruck(String truckId) async {
    try {
      final res = await apiService.makePostRequest(saveTruckEndpoint(truckId), {}, {
        ...requireTokenHeader
      },);
      print("Response: ${res.toJson()}");
      if (res.status == true) {
        return ServiceResponse(
            status: res.status,
            message: res.message,
            data: res.message
        );
      }
      return ServiceResponse(
          status: res.status,
          message: res.message,
          data: null
      );
    } catch (error) {
      return ServiceResponse(data: null, message: "Error $error", status: false);
    }
  }

  @override
  Future<ServiceResponse<List<VehicleModel>>> getSavedVehicles() async {
    try {
      final res = await apiService.makeGetRequest(getSavedTruckEndpoint, {
        ...requireTokenHeader
      },);
      print("Response: ${res.toJson()}");
      if (res.status == true) {
        return ServiceResponse(
          status: res.status,
          message: res.message,
          data: List.from(res.data['data']).map((e) => VehicleModel.fromJson(e['truck'])).toList()
        );
      }
      return ServiceResponse(
        status: res.status,
        message: res.message,
        data: null
      );
    } catch (error) {
      rethrow;
      return ServiceResponse(data: null, message: "Error $error", status: false);
    }
  }

  @override
  Future<ServiceResponse<List<VehicleModel>>> getRecentlyViewedVehicles() async {
    try {
      final res = await apiService.makeGetRequest(getRecentlyViewedTruckEndpoint, {
        ...requireTokenHeader
      },);
      print("Response: ${res.toJson()}");
      if (res.status == true) {
        return ServiceResponse(
          status: res.status,
          message: res.message,
          data: List.from(res.data['data']).map((e) => VehicleModel.fromJson(e['truck'])).toList()
        );
      }
      return ServiceResponse(
          status: res.status,
          message: res.message,
          data: null
      );
    } catch (error) {
      return ServiceResponse(data: null, message: "Error $error", status: false);
    }
  }

}