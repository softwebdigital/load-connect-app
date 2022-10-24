import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:load_connect_driver/backend/models/dtos/reset_password_request.dart';
import 'package:load_connect_driver/backend/services/core/i_local_storage.dart';
import 'package:load_connect_driver/backend/services/i_auth_service.dart';
import 'package:load_connect_driver/shared/constants.dart';
import 'package:load_connect_driver/shared/routes.dart';
import 'package:load_connect_driver/view/interaction/toast_alert.dart';
import 'package:load_connect_driver/view/providers/base_provider.dart';

class ResetPasswordProvider extends BaseProvider {

  String _password = '';
  String _confirmPassword = '';

  String token = "";

  bool _passwordIsVisible = false;
  bool _confirmPasswordIsVisible = false;
  String get password => _password;
  String get confirmPassword => _confirmPassword;

  bool get passwordIsVisible => _passwordIsVisible;
  bool get confirmPasswordIsVisible => _confirmPasswordIsVisible;

  void togglePasswordVisibility() {
    _passwordIsVisible = !_passwordIsVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _confirmPasswordIsVisible = !_confirmPasswordIsVisible;
    notifyListeners();
  }

  set setPassword(String value) {
    _password = value;
    // notifyListeners();
  }

  set setConfirmPassword(String value) {
    _confirmPassword = value;
    // notifyListeners();
  }


  void resetPassword(BuildContext context) async {
    try {
      if (_password.isEmpty) {
        ToastAlert.showErrorAlert("Please provide a new password");
      } else if (_password != _confirmPassword) {
        ToastAlert.showErrorAlert("Password and confirm password must be the same.");
      } else {
        final userId = await Get.find<ILocalStorageService>().getItem(userDataBox, userIdKey);
        ToastAlert.showLoadingAlert("");
        final request = ResetPasswordRequest(
          password: _password,
          confirmPassword: _confirmPassword,
        );
        final res = await Get.find<IAuthService>().resetPassword(request);
        ToastAlert.closeAlert();
        if (res.status) {
          ToastAlert.showAlert("Password reset successful");
          Get.offAllNamed(Routes.login);
        } else {
          ToastAlert.showErrorAlert(res.message);
        }
      }

    } catch (error) {
      ToastAlert.closeAlert();
      ToastAlert.showErrorAlert("Error: $error");
      rethrow;
    }
  }

  ResetPasswordProvider();
}