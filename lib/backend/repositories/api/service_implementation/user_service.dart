

import 'package:dio/src/form_data.dart';
import 'package:load_connect/backend/models/core/service_response.dart';
import 'package:load_connect/backend/models/dtos/change_password_request.dart';
import 'package:load_connect/backend/models/dtos/edit_profile_request.dart';
import 'package:load_connect/backend/models/dtos/notification_settings_request.dart';
import 'package:load_connect/backend/models/entities/blocked_user_model.dart';
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
  Future<ServiceResponse<bool>> deactivateAccount(String password) async {
    try {
      // final apiService = ApiService.createInstance();
      final res = await apiService.makePutRequest(deActivateAccountEndpoint, {
        "password": password
      }, {
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

  @override
  Future<ServiceResponse<List<BlockedUserModel>>> blockedUsers() async {
    try {
      final res = await apiService.makeGetRequest(blockedUsersEndpoint, {
        ...requireTokenHeader
      },);
      print("Response: ${res.toJson()}");
      if (res.status == true) {
        return ServiceResponse(
          status: res.status,
          message: res.message,
          data: List.from(res.data['data']).map((e) => BlockedUserModel.fromJson(e)).toList()
        );
      } else {
        return ServiceResponse(
          status: res.status,
          message: res.message,
          data: null
        );
      }

    } catch (error) {
      return ServiceResponse(data: null, message: "Error $error", status: false);
    }
  }

  @override
  Future<ServiceResponse<String>> blockUser(String uid) async {
    try {
      final res = await apiService.makePostRequest(blockUserEndpoint(uid), {}, {
        ...requireTokenHeader
      }, useFormData: false);
      print("Response: ${res.toJson()}");
      return ServiceResponse(
          status: res.status,
          message: res.message,
          data: res.message
      );
    } catch (error) {
      return ServiceResponse(data: null, message: "Error $error", status: false);
    }
  }

  @override
  Future<ServiceResponse<String>> unBlockUser(String uid) async {
    try {
      final res = await apiService.makePostRequest(unBlockUserEndpoint(uid), {}, {
        ...requireTokenHeader
      }, useFormData: false);
      print("Response: ${res.toJson()}");
      return ServiceResponse(
          status: res.status,
          message: res.message,
          data: res.message
      );
    } catch (error) {
      return ServiceResponse(data: null, message: "Error $error", status: false);
    }
  }

  @override
  Future<ServiceResponse<String>> uploadKycDocument(FormData data) async {
    try {
      final res = await apiService.makePostRequest(uploadKYCEndpoint, data, {
        ...requireTokenHeader
      }, useFormData: false);
      print("Response: ${res.toJson()}");
      return ServiceResponse(
          status: res.status,
          message: res.message,
          data: res.message
      );
    } catch (error) {
      return ServiceResponse(data: null, message: "Error $error", status: false);
    }
  }

}