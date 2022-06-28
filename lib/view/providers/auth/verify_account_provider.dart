
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:load_connect/backend/models/dtos/generate_token_request.dart';
import 'package:load_connect/backend/models/dtos/verify_token_request.dart';
import 'package:load_connect/backend/services/i_auth_service.dart';
import 'package:load_connect/shared/routes.dart';
import 'package:load_connect/view/interaction/toast_alert.dart';
import 'package:load_connect/view/providers/base_provider.dart';

class VerifyAccountProvider extends BaseProvider {

  String _otp = "";
  late String userId;

  VerifyAccountProvider(this.userId);

  set setOtp(String otp) {
    _otp = otp;
    notifyListeners();
  }

  void verifyAccount(BuildContext context) async {
    try {
      print(userId);
      if (_otp.isEmpty) {
        ToastAlert.showErrorAlert("OTP is required to continue");
      } else {
        ToastAlert.showLoadingAlert("");
        final res = await Get.find<IAuthService>().verifyToken(VerifyTokenRequest(
          userId: int.parse(userId),
          token: _otp
        ));
        ToastAlert.closeAlert();

        if (res.status) {
          ToastAlert.showAlert("Account verification successful");
          Get.offAndToNamed(Routes.login);
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

  void resendOtp() async {
    try {
      // print(userId);

      ToastAlert.showLoadingAlert("");
      final res = await Get.find<IAuthService>().generateToken(GenerateTokenRequest(
        userId: int.parse(userId),
        type: 'register'
      ));
      ToastAlert.closeAlert();
      if (res.status) {
        ToastAlert.showAlert("Token have been resent to your email");
        // Get.offAndToNamed(Routes.login);
      } else {
        ToastAlert.showErrorAlert(res.message);
      }
    } catch (error) {
      ToastAlert.closeAlert();
      ToastAlert.showErrorAlert("Error: $error");
    }
  }

}