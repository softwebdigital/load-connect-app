

import 'package:dio/dio.dart';
import 'package:load_connect_driver/backend/models/core/service_response.dart';
import 'package:load_connect_driver/backend/models/dtos/change_password_request.dart';
import 'package:load_connect_driver/backend/models/dtos/edit_profile_request.dart';
import 'package:load_connect_driver/backend/models/entities/user_model.dart';

import '../models/dtos/notification_settings_request.dart';
import '../models/entities/blocked_user_model.dart';
import '../models/entities/notification_settings_model.dart';

abstract class IUserService {
  Future<ServiceResponse<UserModel>> getFullProfile();
  Future<ServiceResponse<UserModel>> changePassword(ChangePasswordRequest request);
  Future<ServiceResponse<UserModel>> editProfile(EditProfileRequest request);
  Future<ServiceResponse<bool>> deactivateAccount(String password);
  Future<ServiceResponse<String>> updateProfilePicture(FormData data);
  Future<ServiceResponse<NotificationSettingsModel>> getNotificationSettings();
  Future<ServiceResponse<NotificationSettingsModel>> updateNotificationSettings(NotificationSettingsRequest request);
  Future<ServiceResponse<List<BlockedUserModel>>> blockedUsers();
  Future<ServiceResponse<String>> blockUser(String uid);
  Future<ServiceResponse<String>> unBlockUser(String uid);
  Future<ServiceResponse<String>> uploadKycDocument(FormData data);
}