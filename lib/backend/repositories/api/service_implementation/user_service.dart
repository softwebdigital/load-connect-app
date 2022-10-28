

import 'package:load_connect/backend/models/core/service_response.dart';
import 'package:load_connect/backend/models/dtos/change_password_request.dart';
import 'package:load_connect/backend/models/dtos/edit_profile_request.dart';
import 'package:load_connect/backend/models/dtos/notification_settings_request.dart';
import 'package:load_connect/backend/models/entities/full_profile_model.dart';
import 'package:load_connect/backend/models/entities/notification_settings_model.dart';
import 'package:load_connect/backend/models/entities/user_model.dart';
import 'package:load_connect/backend/repositories/api/core/api_service.dart';
import 'package:load_connect/backend/repositories/api/core/endpoints.dart';
import 'package:load_connect/backend/services/i_user_service.dart';
import 'package:load_connect/shared/constants.dart';

class UserService implements IUserService {

  final apiService = ApiService();

  @override
  Future<ServiceResponse<UserModel>> getFullProfile() async {
    try {
      // final apiService = ApiService.createInstance();
      final res = await apiService.makeGetRequest(userEndpoint, null);
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
  Future<ServiceResponse<UserModel>> changePassword(ChangePasswordRequest request) async {
    try {
      // final apiService = ApiService.createInstance();
      final res = await apiService.makePostRequest(changePasswordEndpoint, request.toJson(), {
        ...requireTokenHeader
      });
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

  @override
  Future<ServiceResponse<UserModel>> editProfile(EditProfileRequest request) async {
    try {
      // final apiService = ApiService.createInstance();
      final res = await apiService.makePutRequest(updateProfileEndpoint, request.toJson(), null);
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

  @override
  Future<ServiceResponse<bool>> deactivateAccount() async {
    try {
      // final apiService = ApiService.createInstance();
      final res = await apiService.makePostRequest(deActivateAccountEndpoint, {}, {
        ...requireTokenHeader
      });
      print("Response: ${res.toJson()}");
      return ServiceResponse(
        status: res.status,
        message: res.message,
        data: true
      );

    } catch (error) {
      return ServiceResponse(data: null, message: "Error: $error", status: false);
    }
  }

  @override
  Future<ServiceResponse<String>> updateProfilePicture(data) async {
    try {
      // final apiService = ApiService.createInstance();
      final res = await apiService.makePostRequest(updateProfilePictureEndpoint, data, {
        ...requireTokenHeader
      }, useFormData: false);
      print("Response: ${res.toJson()}");
      return ServiceResponse(
        status: res.status,
        message: res.message,
        data: res.message
      );

    } catch (error) {
      return ServiceResponse(data: null, message: "Error: $error", status: false);
    }
  }

  @override
  Future<ServiceResponse<NotificationSettingsModel>> getNotificationSettings() async {
    try {
      final res = await apiService.makeGetRequest(userNotificationSettingsEndpoint, {
        ...requireTokenHeader
      });
      print("Response: ${res.toJson()}");
      return ServiceResponse(
        status: res.status,
        message: res.message,
        data: NotificationSettingsModel.fromJson(res.data)
      );
    } catch (error) {
      return ServiceResponse(data: null, message: "Error $error", status: false);
    }
  }

  @override
  Future<ServiceResponse<NotificationSettingsModel>> updateNotificationSettings(NotificationSettingsRequest request) async {
    try {
      final res = await apiService.makePostRequest(userNotificationSettingsEndpoint, request.toJson(), {
        ...requireTokenHeader
      }, useFormData: true);
      print("Response: ${res.toJson()}");
      return ServiceResponse(
        status: res.status,
        message: res.message,
        data: NotificationSettingsModel.fromJson(res.data)
      );
    } catch (error) {
      return ServiceResponse(data: null, message: "Error $error", status: false);
    }
  }

}