

import 'package:load_connect_driver/backend/models/core/service_response.dart';
import 'package:load_connect_driver/backend/models/entities/closest_vehicle_response.dart';
import 'package:load_connect_driver/backend/models/entities/system_config_model.dart';
import 'package:load_connect_driver/backend/models/entities/vehicle_type_model.dart';
import 'package:load_connect_driver/backend/repositories/api/core/api_service.dart';
import 'package:load_connect_driver/backend/repositories/api/core/endpoints.dart';
import 'package:load_connect_driver/backend/services/i_util_service.dart';

class ApiUtilService implements IUtilService {

  final apiService = ApiService();

  @override
  Future<ServiceResponse<List<SystemConfigModel>>> getSystemConfig() {
    throw UnimplementedError();
  }

  @override
  Future<ServiceResponse<List<VehicleTypeModel>>> getVehicleTypes() async {
    throw UnimplementedError();
    // try {
    //   final res = await apiService.makeGetRequest(getVehicleTypesEndpoint, {
    //     'Content-Type': 'application/json',
    //     "Accept": 'application/json'
    //   });
    //   print("ApiRes: ${res.toJson()}");
    //   return ServiceResponse(
    //     status: true,
    //     message: "Returned",
    //     data: res.data == null ? null : List.from(res.data['data']).map((e) => VehicleTypeModel.fromJson(e)).toList()
    //   );
    // } catch (error) {
    //   return ServiceResponse(
    //     status: false,
    //     data: null,
    //     message: "Error occurred"
    //   );
    // }
  }

  @override
  Future<ServiceResponse<ClosestVehicleResponse>> getClosestAvailableTruck(String lat, String lng) async {
    throw UnimplementedError();
    // try {
    //   final res = await apiService.makeGetRequest(getClosestVehicleEndpoint('lat', 'lng'), {
    //     'Content-Type': 'application/json',
    //     "Accept": 'application/json'
    //   });
    //   // print("ApiRes: ${res.toJson()}");
    //   return ServiceResponse(
    //     status: true,
    //     message: "Returned",
    //     data: ClosestVehicleResponse.fromJson(res.toJson())
    //   );
    // } catch (error) {
    //   print("ReturnedFromCatch");
    //   // rethrow;
    //   return ServiceResponse(
    //     status: false,
    //     data: null,
    //     message: "Error occurred"
    //   );
    // }
  }

}