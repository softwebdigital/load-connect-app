
import 'package:load_connect_driver/backend/models/core/service_response.dart';
import 'package:load_connect_driver/backend/models/entities/closest_vehicle_response.dart';
import 'package:load_connect_driver/backend/models/entities/system_config_model.dart';
import 'package:load_connect_driver/backend/models/entities/vehicle_type_model.dart';

abstract class IUtilService {
  Future<ServiceResponse<List<VehicleTypeModel>>> getVehicleTypes();
  Future<ServiceResponse<List<SystemConfigModel>>> getSystemConfig();
  Future<ServiceResponse<ClosestVehicleResponse>> getClosestAvailableTruck(String lat, String lng);
}