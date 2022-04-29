import 'package:flutter/foundation.dart' show debugPrint;
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final isForgotPassword = true.obs;
  final _isBusy = false.obs;
  final hideText = false.obs;

  bool get isBusy => _isBusy.value;
  // bool get hideText => _isBusy.value;
  // set hideText(val) {
  //   _hideText.value = val;
  // }

  @override
  void onInit() {
    super.onInit();
    debugPrint("Forgot password route params: ${Get.parameters}");
    debugPrint("Forgot password controller route name: ${Get.currentRoute}");
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  void runForgotPassword() {
    _isBusy.toggle();
    Future.delayed(const Duration(seconds: 3), () {
      _isBusy.toggle();
      isForgotPassword.toggle();
    });
  }

  Future<bool> validateOtp() {
    _isBusy.toggle();

    return Future.delayed(const Duration(seconds: 3), () {
      _isBusy.toggle();
      return true;
    });
  }

  void returnToEmailPhone() {
    isForgotPassword.toggle();
  }
}
