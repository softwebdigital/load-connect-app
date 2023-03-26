

import 'package:dio/dio.dart';
import 'package:load_connect_driver/backend/models/entities/truck_category_model.dart';
import 'package:load_connect_driver/backend/models/entities/truck_type_model.dart';

import '../models/core/service_response.dart';
import '../models/entities/driver_truck_model.dart';

abstract class ITruckService {
  Future<ServiceResponse<List<DriverTruckModel>>> myTrucks();
  Future<ServiceResponse<List<TruckTypeModel>>> getTruckTypes();
  Future<ServiceResponse<List<TruckCategoryModel>>> getTruckCategories();
  Future<ServiceResponse<DriverTruckModel>> getTruck(String truckId);
  Future<ServiceResponse<String>> createTruck(FormData request);
}