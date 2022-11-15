

import 'package:dio/src/form_data.dart';
import 'package:load_connect_driver/backend/models/core/service_response.dart';
import 'package:load_connect_driver/backend/models/entities/driver_truck_model.dart';
import 'package:load_connect_driver/backend/repositories/api/core/endpoints.dart';
import 'package:load_connect_driver/backend/services/i_truck_service.dart';
import 'package:load_connect_driver/shared/constants.dart';

import '../core/api_service.dart';

class ApiTruckService implements ITruckService {

  final apiService = ApiService();


  @override
  Future<ServiceResponse<String>> createTruck(FormData request) async {
    try {
      final res = await apiService.makePostRequest(createTruckEndpoint, request, {
        ...requireTokenHeader
      }, useFormData: false);
      if (res.status == true) {
        return ServiceResponse(
          message: res.message,
          status: true, data: "Truck created successfully"
        );
      }
      return ServiceResponse(
          message: res.message,
          status: false,
      );
     } catch (error) {
      return ServiceResponse(
          message: "Error: $error",
          status: false,
          data: null
      );
    }
  }

  @override
  Future<ServiceResponse<List<DriverTruckModel>>> myTrucks() async {
    try {
      final res = await apiService.makeGetRequest(driverTruckEndpoint, {
        ...requireTokenHeader
      });
      if (res.status == true) {
        return ServiceResponse(
          status: true,
          data: List.from(res.data['data']).map((e) => DriverTruckModel.fromJson(e)).toList()
        );
      }
      return ServiceResponse(
        message: "Error: ${res.message}"
      );
    } catch (error) {
      return ServiceResponse(
        message: "Error: $error",
        status: false,
        data: null
      );
    }
  }

  @override
  Future<ServiceResponse<DriverTruckModel>> getTruck(String truckId) async {
    try {
      final res = await apiService.makeGetRequest(getTruckDetailEndpoint(truckId), {
        ...requireTokenHeader
      });
      if (res.status == true) {
        return ServiceResponse(
          status: true,
          data: DriverTruckModel.fromJson(res.data['data'])
        );
      }
      return ServiceResponse(
          message: "Error: ${res.message}"
      );
    } catch (error) {
      return ServiceResponse(
          message: "Error: $error",
          status: false,
          data: null
      );
    }
  }

}