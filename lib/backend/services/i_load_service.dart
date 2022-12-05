

import 'package:dio/dio.dart';
import 'package:load_connect_driver/backend/models/core/service_response.dart';
import 'package:load_connect_driver/backend/models/entities/user_load.dart';

abstract class ILoadService {
  Future<ServiceResponse> createLoad(FormData request);
  Future<ServiceResponse<List<UserLoad>>> getUserLoads();
  Future<ServiceResponse<UserLoad>> getLoad(String loadId);
  Future<ServiceResponse<String>> acceptOffer(String loadId);
  Future<ServiceResponse<String>> declineOffer(String loadId);
  Future<ServiceResponse<String>> negotiateOffer(String loadId, num amount);
}