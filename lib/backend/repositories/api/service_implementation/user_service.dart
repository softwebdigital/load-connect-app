

import 'package:load_connect/backend/models/core/service_response.dart';
import 'package:load_connect/backend/models/dtos/change_password_request.dart';
import 'package:load_connect/backend/models/dtos/edit_profile_request.dart';
import 'package:load_connect/backend/models/entities/full_profile_model.dart';
import 'package:load_connect/backend/models/entities/user_model.dart';
import 'package:load_connect/backend/repositories/api/core/api_service.dart';
import 'package:load_connect/backend/repositories/api/core/endpoints.dart';
import 'package:load_connect/backend/services/i_user_service.dart';

class UserService implements IUserService {

  @override
  Future<ServiceResponse<FullProfileModel>> getFullProfile() async {
    try {
      final apiService = ApiService.createInstance();
      final res = await apiService.makeGetRequest(userEndpoint, null);
      print("Response: ${res.toJson()}");
      return ServiceResponse(
        status: res.status,
        message: res.message,
        data: res.data != null ? FullProfileModel.fromJson(res.data['data']) : null
      );

    } catch (error) {
      // rethrow;
      return ServiceResponse(
          data: null,
          message: "Error: $error",
          status: false
      );
    }
  }

  @override
  Future<ServiceResponse<UserModel>> changePassword(ChangePasswordRequest request) async {
    try {
      final apiService = ApiService.createInstance();
      final res = await apiService.makePostRequest(changePasswordEndpoint, request.toJson(), null);
      print("Response: ${res.toJson()}");
      return ServiceResponse(
        status: res.status,
        message: res.message,
        data: res.data != null ? UserModel.fromJson(res.data['data']) : null
      );

    } catch (error) {
      // rethrow;
      return ServiceResponse(
          data: null,
          message: "Error: $error",
          status: false
      );
    }
  }

  @override
  Future<ServiceResponse<UserModel>> editProfile(EditProfileRequest request) async {
    try {
      final apiService = ApiService.createInstance();
      final res = await apiService.makePostRequest(updateProfileEndpoint, request.toJson(), null);
      print("Response: ${res.toJson()}");
      return ServiceResponse(
          status: res.status,
          message: res.message,
          data: res.data != null ? UserModel.fromJson(res.data['data']) : null
      );

    } catch (error) {
      // rethrow;
      return ServiceResponse(data: null, message: "Error: $error", status: false);
    }
  }

}