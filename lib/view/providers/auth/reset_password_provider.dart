


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:load_connect/backend/models/dtos/reset_password_request.dart';
import 'package:load_connect/backend/services/i_auth_service.dart';
import 'package:load_connect/view/interaction/toast_alert.dart';
import 'package:load_connect/view/providers/base_provider.dart';

class ResetPasswordProvider extends BaseProvider {

  String _password = '';
  String _confirmPassword = '';

  late String token;
  late String userId;

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
    notifyListeners();
  }

  set setConfirmPassword(String value) {
    _confirmPassword = value;
    notifyListeners();
  }


  void resetPassword(BuildContext context) async {
    try {
      ToastAlert.showLoadingAlert("");
      final request = ResetPasswordRequest(
        token: token,
        userId: int.parse(userId),
        password: _password
      );
      final res = await Get.find<IAuthService>().resetPassword(request);
      if (res.status) {
        ToastAlert.showAlert(res.message);
      } else {
        ToastAlert.showErrorAlert(res.message);
      }
    } catch (error) {
      ToastAlert.closeAlert();
      ToastAlert.showErrorAlert("Error: $error");
    }
  }


  ResetPasswordProvider({required this.token, required this.userId});


}