

import 'package:load_connect/backend/models/core/service_response.dart';
import 'package:load_connect/backend/models/entities/system_config_model.dart';
import 'package:load_connect/backend/models/entities/vehicle_type_model.dart';
import 'package:load_connect/backend/services/i_util_service.dart';

class ApiUtilService implements IUtilService {
  @override
  Future<ServiceResponse<List<SystemConfigModel>>> getSystemConfig() {
    // TODO: implement getSystemConfig
    throw UnimplementedError();
  }

  @override
  Future<ServiceResponse<List<VehicleTypeModel>>> getVehicleTypes() {
    // TODO: implement getVehicleTypes
    throw UnimplementedError();
  }

}