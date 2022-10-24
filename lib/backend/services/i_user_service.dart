

import 'package:load_connect_driver/backend/models/core/service_response.dart';
import 'package:load_connect_driver/backend/models/dtos/change_password_request.dart';
import 'package:load_connect_driver/backend/models/dtos/edit_profile_request.dart';
import 'package:load_connect_driver/backend/models/entities/full_profile_model.dart';
import 'package:load_connect_driver/backend/models/entities/user_model.dart';

abstract class IUserService {
  Future<ServiceResponse<UserModel>> getFullProfile();
  Future<ServiceResponse<UserModel>> changePassword(ChangePasswordRequest request);
  Future<ServiceResponse<UserModel>> editProfile(EditProfileRequest request);
  Future<ServiceResponse<bool>> deactivateAccount();
}