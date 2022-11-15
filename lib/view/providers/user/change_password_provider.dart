
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../backend/models/dtos/change_password_request.dart';
import '../../../backend/services/i_user_service.dart';
import '../../interaction/toast_alert.dart';
import '../base_provider.dart';

class ChangePasswordProvider extends BaseProvider {

  String _oldPassword = '';
  String _password = '';
  String _confirmPassword = '';

  bool _oldPasswordIsVisible = false;
  bool _passwordIsVisible = false;
  bool _confirmPasswordIsVisible = false;

  bool get oldPasswordIsVisible => _oldPasswordIsVisible;
  bool get passwordIsVisible => _passwordIsVisible;
  bool get confirmPasswordIsVisible => _confirmPasswordIsVisible;

  void togglePasswordVisibility() {
    _passwordIsVisible = !_passwordIsVisible;
    notifyListeners();
  }

  void toggleOldPasswordVisibility() {
    _oldPasswordIsVisible = !_oldPasswordIsVisible;
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
  set setOldPassword(String value) {
    _oldPassword = value;
    notifyListeners();
  }

  void changePassword(BuildContext context) async {
    try {
      if (_oldPassword.isEmpty) {
        ToastAlert.showErrorAlert("Please provide your current password");
      } else if (_password.isEmpty) {
        ToastAlert.showErrorAlert("Please provide a new password");
      } else if (_confirmPassword != _password) {
        ToastAlert.showErrorAlert("Your new password must match the confirm password");
      } else {
        ToastAlert.showLoadingAlert("");
        final request = ChangePasswordRequest(
            newPassword: _password,
            currentPassword: _oldPassword,
            newConfirmPassword: _confirmPassword
        );
        final res = await Get.find<IUserService>().changePassword(request);
        ToastAlert.closeAlert();
        if (res.status) {
          ToastAlert.showAlert(res.message);
        } else {
          ToastAlert.showErrorAlert(res.message);
        }
      }

    } catch (error) {
      ToastAlert.closeAlert();
      ToastAlert.showErrorAlert("message");
    }
  }

}