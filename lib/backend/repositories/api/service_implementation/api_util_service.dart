

import 'package:load_connect/backend/models/core/service_response.dart';
import 'package:load_connect/backend/models/entities/closest_vehicle_response.dart';
import 'package:load_connect/backend/models/entities/system_config_model.dart';
import 'package:load_connect/backend/models/entities/vehicle_type_model.dart';
import 'package:load_connect/backend/repositories/api/core/api_service.dart';
import 'package:load_connect/backend/repositories/api/core/endpoints.dart';
import 'package:load_connect/backend/services/i_util_service.dart';

class ApiUtilService implements IUtilService {

  final apiService = ApiService();

  @override
  Future<ServiceResponse<List<SystemConfigModel>>> getSystemConfig() {
    throw UnimplementedError();
  }

  @override
  Future<ServiceResponse<List<VehicleTypeModel>>> getVehicleTypes() async {
    try {
      final res = await apiService.makeGetRequest(getVehicleTypesEndpoint, {
        'Content-Type': 'application/json',
        "Accept": 'application/json'
      });
      print("ApiRes: ${res.toJson()}");
      return ServiceResponse(
        status: true,
        message: "Returned",
        data: res.data == null ? null : List.from(res.data['data']).map((e) => VehicleTypeModel.fromJson(e)).toList()
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
  Future<ServiceResponse<ClosestVehicleResponse>> getClosestAvailableTruck(String lat, String lng) async {
    try {
      final res = await apiService.makeGetRequest(getClosestVehicleEndpoint('lat', 'lng'), {
        'Content-Type': 'application/json',
        "Accept": 'application/json'
      });
      // print("ApiRes: ${res.toJson()}");
      return ServiceResponse(
        status: true,
        message: "Returned",
        data: ClosestVehicleResponse.fromJson(res.toJson())
      );
    } catch (error) {
      print("ReturnedFromCatch");
      // rethrow;
      return ServiceResponse(
        status: false,
        data: null,
        message: "Error occurred"
      );
    }
  }

}