
import 'package:load_connect/backend/models/core/service_response.dart';
import 'package:load_connect/backend/models/entities/system_config_model.dart';
import 'package:load_connect/backend/models/entities/vehicle_type_model.dart';

abstract class IUtilService {
  Future<ServiceResponse<List<VehicleTypeModel>>> getVehicleTypes();
  Future<ServiceResponse<List<SystemConfigModel>>> getSystemConfig();
}