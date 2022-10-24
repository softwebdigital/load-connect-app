

import 'package:dio/dio.dart';
import 'package:load_connect_driver/backend/models/core/service_response.dart';
import 'package:load_connect_driver/backend/models/entities/user_load.dart';

abstract class ILoadService {
  Future<ServiceResponse> createLoad(FormData request);
  Future<ServiceResponse<List<UserLoad>>> getUserLoads();
}