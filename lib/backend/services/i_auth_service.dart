
import 'package:dio/dio.dart';
import 'package:load_connect_driver/backend/models/core/service_response.dart';
import 'package:load_connect_driver/backend/models/dtos/create_account_request.dart';
import 'package:load_connect_driver/backend/models/dtos/forgot_password_request.dart';
import 'package:load_connect_driver/backend/models/dtos/generate_token_request.dart';
import 'package:load_connect_driver/backend/models/dtos/login_request.dart';
import 'package:load_connect_driver/backend/models/dtos/login_response.dart';
import 'package:load_connect_driver/backend/models/dtos/reset_password_request.dart';
import 'package:load_connect_driver/backend/models/dtos/verify_token_request.dart';
import 'package:load_connect_driver/backend/models/entities/user_model.dart';

abstract class IAuthService {
  Future<ServiceResponse<LoginResponse>> login(LoginRequest request);
  Future<ServiceResponse<UserModel>> createAccount(CreateAccountRequest request);
  Future<ServiceResponse<String>> generateToken(GenerateTokenRequest request);
  Future<ServiceResponse<UserModel>> verifyToken(VerifyTokenRequest request);
  Future<ServiceResponse<String>> verifyForgetPassword(VerifyTokenRequest request);
  Future<ServiceResponse<String>> forgotPassword(ForgotPasswordRequest request);
  Future<ServiceResponse<String>> resetPassword(ResetPasswordRequest request);
  Future<ServiceResponse<String>> completeProfile(FormData request);
  Future<ServiceResponse<String>> resendRegistrationEmail(String email);
}