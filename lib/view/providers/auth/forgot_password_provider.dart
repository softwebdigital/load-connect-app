
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:load_connect/backend/models/dtos/forgot_password_request.dart';
import 'package:load_connect/backend/services/i_auth_service.dart';
import 'package:load_connect/view/interaction/toast_alert.dart';
import 'package:load_connect/view/providers/base_provider.dart';

class ForgotPasswordProvider extends BaseProvider {

  String _email = "";

  String get email => _email;

  set setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void forgotPassword(BuildContext context) async {
    try {
      final request = ForgotPasswordRequest(
        email: _email
      );
      if (_email.isEmpty) {
        ToastAlert.showErrorAlert("Please provide your registered email address...");
      } else {
        ToastAlert.showLoadingAlert("message");
        final res = await Get.find<IAuthService>().forgotPassword(request);
        ToastAlert.closeAlert();
        if (res.status) {
          ToastAlert.showAlert(res.message);
        } else {
          ToastAlert.showErrorAlert(res.message);
        }
      }
    } catch (error) {
      ToastAlert.showErrorAlert("Error: $error");
    }
  }
}