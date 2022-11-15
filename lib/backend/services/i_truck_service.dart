

import 'package:dio/dio.dart';

import '../models/core/service_response.dart';
import '../models/entities/driver_truck_model.dart';

abstract class ITruckService {
  Future<ServiceResponse<List<DriverTruckModel>>> myTrucks();
  Future<ServiceResponse<DriverTruckModel>> getTruck(String truckId);
  Future<ServiceResponse<String>> createTruck(FormData request);
}