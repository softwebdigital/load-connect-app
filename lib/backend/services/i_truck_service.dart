

import 'package:load_connect/backend/models/core/service_response.dart';
import 'package:load_connect/backend/models/entities/vehicle_model.dart';

abstract class ITruckService {
  Future<ServiceResponse<List<VehicleModel>>> getVehicles();
  Future<ServiceResponse<List<VehicleModel>>> getSavedVehicles();
  Future<ServiceResponse<List<VehicleModel>>> getRecentlyViewedVehicles();
  Future<ServiceResponse<String>> saveTruck(String truckId);
}