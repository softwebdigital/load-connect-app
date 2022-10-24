import 'package:dio/src/form_data.dart';
import 'package:load_connect/backend/models/core/api_response.dart';
import 'package:load_connect/backend/models/core/service_response.dart';
import 'package:load_connect/backend/models/dtos/create_account_request.dart';
import 'package:load_connect/backend/models/dtos/forgot_password_request.dart';
import 'package:load_connect/backend/models/dtos/generate_token_request.dart';
import 'package:load_connect/backend/models/dtos/login_request.dart';
import 'package:load_connect/backend/models/dtos/login_response.dart';
import 'package:load_connect/backend/models/dtos/reset_password_request.dart';
import 'package:load_connect/backend/models/dtos/verify_token_request.dart';
import 'package:load_connect/backend/models/entities/user_model.dart';
import 'package:load_connect/backend/repositories/api/core/api_service.dart';
import 'package:load_connect/backend/repositories/api/core/endpoints.dart';
import 'package:load_connect/backend/services/i_auth_service.dart';
import 'package:load_connect/shared/constants.dart';

class ApiAuthService implements IAuthService {

  final apiService = ApiService();


  @override
  Future<ServiceResponse<LoginResponse>> login(LoginRequest request) async {
    try {
      // final apiService = ApiService.createInstance();
      final res = await apiService.makePostRequest(loginEndpoint, request.toJson(), {
        ...requireTokenHeader
      });
      if (res.data == null) {
        return ServiceResponse(
          status: res.status,
          message: res.message,
          data: null
        );
      } else {
        print("LoginServiceResponse: ${res.data}");
        final fRes = ApiResponse.fromJson(res.data);
        return ServiceResponse(
          status: fRes.status,
          message: fRes.message,
          data: fRes.data != null ? LoginResponse.fromJson(fRes.data) : null
        );
      }

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
  Future<ServiceResponse<UserModel>> createAccount(CreateAccountRequest request) async {
    try {
      // print(request.toJson());
      // final apiService = ApiService.createInstance();
      final res = await apiService.makePostRequest(registerEndpoint, request.toJson(), null);
      print("ResponseService: ${res.data}");
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
  Future<ServiceResponse<String>> forgotPassword(ForgotPasswordRequest request) async {
    try {
      // final apiService = ApiService.createInstance();
      final res = await apiService.makePostRequest(forgotPasswordEndpoint, request.toJson(), null);

      return ServiceResponse(
        status: res.status,
        message: res.message,
        data: ""
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
  Future<ServiceResponse<String>> generateToken(GenerateTokenRequest request) async {
    try {
      // final apiService = ApiService.createInstance();
      final res = await apiService.makePostRequest(generateTokenEndpoint, request.toJson(), null);

      return ServiceResponse(
        status: res.status,
        message: res.message,
        data: res.data ?? res.message
      );
    } catch (error) {
      return ServiceResponse(
          data: null,
          message: "Error: $error",
          status: false
      );
    }
  }

  @override
  Future<ServiceResponse<String>> resetPassword(ResetPasswordRequest request) async {
    try {
      // final apiService = ApiService.createInstance();
      final res = await apiService.makePostRequest(resetPasswordEndpoint, request.toJson(), null);

      return ServiceResponse(
          status: res.status,
          message: res.message,
          data: null
      );

    } catch (error) {
      return ServiceResponse(
          data: null,
          message: "Error: $error",
          status: false
      );
    }
  }

  @override
  Future<ServiceResponse<UserModel>> verifyToken(VerifyTokenRequest request) async {
    try {
      // final apiService = ApiService.createInstance();
      final res = await apiService.makePostRequest(verifyTokenEndpoint, request.toJson(), null);
      print("VerifyTokenResponse: ${res.data}");
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
  Future<ServiceResponse<String>> completeProfile(FormData request) async {
    try {
      // final apiService = ApiService.createInstance();
      final res = await apiService.makePostRequest(completeProfileEndpoint, request, null, useFormData: false);
      print("CompleteProfileResponse: ${res.toJson()}");
      return ServiceResponse(
          status: res.status,
          message: res.message,
          data: res.data != null ? res.data['data'] : null
      );
    } catch (error) {
      // rethrow;
      return ServiceResponse(data: null, message: "Error: $error", status: false);
    }
  }

  @override
  Future<ServiceResponse<String>> resendRegistrationEmail(String email) async {
    try {
      // final apiService = ApiService.createInstance();
      final res = await apiService.makePostRequest(resendRegistrationEmailEndpoint, {
        "login": email
      }, null);
      print("VerifyTokenResponse: ${res.data}");
      return ServiceResponse(
          status: res.status,
          message: res.message,
          data: res.message
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
  Future<ServiceResponse<String>> verifyForgetPassword(VerifyTokenRequest request) async {
    try {
      // final apiService = ApiService.createInstance();
      final res = await apiService.makePostRequest(verifyForgetPasswordEndpoint, request.toJson(), null);
      print("VerifyForgotPassword: ${res.data}");
      return ServiceResponse(
          status: res.status,
          message: res.message,
          data: res.data != null ? res.data['data']['token'] : null
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

}

