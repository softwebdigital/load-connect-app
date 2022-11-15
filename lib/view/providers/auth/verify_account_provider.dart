import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:load_connect_driver/backend/models/core/service_response.dart';
import 'package:load_connect_driver/backend/models/dtos/verify_token_request.dart';
import 'package:load_connect_driver/backend/services/core/i_local_storage.dart';
import 'package:load_connect_driver/backend/services/i_auth_service.dart';
import 'package:load_connect_driver/shared/constants.dart';
import 'package:load_connect_driver/shared/routes.dart';
import 'package:load_connect_driver/view/interaction/toast_alert.dart';
import 'package:load_connect_driver/view/providers/base_provider.dart';

class VerifyAccountProvider extends BaseProvider {

  String _otp = "";
  late String type;
  late String email;

  String get otp => _otp;

  VerifyAccountProvider(this.email, this.type) {
    _startTimer();
  }

  Timer? _timer;
  num seconds = 60*1.5;

  set setOtp(String otp) {
    _otp = otp;
    // notifyListeners();
  }

  void verifyAccount(BuildContext context) async {
    try {
      print(email);
      if (_otp.isEmpty) {
        ToastAlert.showErrorAlert("OTP is required to continue");
      } else {
        ToastAlert.showLoadingAlert("");
        final request = VerifyTokenRequest(
            email: email,
            otp: _otp
        );
        print(request.toJson());
        ServiceResponse<Object> res;
        if (type == "register") {
          res = await Get.find<IAuthService>().verifyToken(request);
        } else {
          res = await Get.find<IAuthService>().verifyForgetPassword(request);

        }
        ToastAlert.closeAlert();

        if (res.status) {
          ToastAlert.showAlert("Account verification successful");
          if (type == 'register') {
            Get.offAndToNamed(Routes.login);
          }
          if (type == 'forget') {
            print("Hello ::: ${res.data}");
            await Get.find<ILocalStorageService>().setItem(userDataBox, userTokenKey, res.data);
            Get.offAndToNamed(Routes.resetPassword+"?token=$otp");
          }
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
      if (seconds == 0) {
        ToastAlert.showLoadingAlert("");
        final res = await Get.find<IAuthService>().resendRegistrationEmail(email);
        ToastAlert.closeAlert();
        if (res.status) {
          ToastAlert.showAlert("Otp resent successfully.");
          // Get.offAndToNamed(Routes.login);
          _startTimer();
        } else {
          ToastAlert.showErrorAlert(res.message);
        }
      }

    } catch (error) {
      ToastAlert.closeAlert();
      ToastAlert.showErrorAlert("Error: $error");
    }
  }

  void _startTimer() {
    _timer?.cancel();
    seconds = 60*1.5;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      seconds--;
      if (seconds == 0) {
        _timer?.cancel();
      }
      notifyListeners();
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }
}