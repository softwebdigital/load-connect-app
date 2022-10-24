

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:load_connect/backend/models/dtos/generate_token_request.dart';
import 'package:load_connect/backend/models/dtos/login_request.dart';
import 'package:load_connect/backend/services/core/i_local_storage.dart';
import 'package:load_connect/backend/services/i_auth_service.dart';
import 'package:load_connect/shared/constants.dart';
import 'package:load_connect/shared/routes.dart';
import 'package:load_connect/view/interaction/toast_alert.dart';
import 'package:load_connect/view/providers/base_provider.dart';
import 'package:load_connect/view/providers/user/user_profile_provider.dart';
import 'package:provider/provider.dart';

class LoginProvider extends BaseProvider {

  String _email = '';
  String _password = '';

  bool _passwordIdVisible = false;
  String get email => _email;
  String get password => _password;

  bool get passwordIsVisible => _passwordIdVisible;

  void togglePasswordVisibility() {
    _passwordIdVisible = !_passwordIdVisible;
    notifyListeners();
  }

  set setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  set setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void login(BuildContext context) async {
    try {
      // Get.find<OverwoodRoute>().replaceAll([const HomeScreen()]);
      if (_password.isEmpty || _email.isEmpty) {
        ToastAlert.showErrorAlert("Email and Password field's are required to continue");
      } else {
        ToastAlert.showLoadingAlert("");
        final res = await Get.find<IAuthService>().login(LoginRequest(
          email: _email, password: _password
        ));
        ToastAlert.closeAlert();
        if (res.status == true) {
          if (res.message == 'unverified') {
            ToastAlert.showErrorAlert("Account not verified");
            await Get.find<IAuthService>().generateToken(GenerateTokenRequest(
                userId: res.data!.user!.id,
                type: 'register'
            ));
            Get.offNamed(
              "${Routes.registrationOtp}?user_id=${res.data!.user!.id}",
            );
          } else {
            print("UserToken: ${res.data!.token!}");
            Get.find<ILocalStorageService>().setItem(userDataBox, userTokenKey, res.data!.token);
            Get.find<ILocalStorageService>().setItem(appDataBox, loggedInBeforeKey, true);
            Provider.of<UserProfileProvider>(context, listen: false).setUser = res.data!.user!;
            Provider.of<UserProfileProvider>(context, listen: false).initialize();
            ToastAlert.showAlert("Login successful");
            Get.offAllNamed(Routes.home);
          }
        } else {
          if (res.message.contains('unverified')) {
            ToastAlert.showErrorAlert("Account not verified");
            await Get.find<IAuthService>().generateToken(GenerateTokenRequest(
                userId: res.data!.user!.id,
                type: 'register'
            ));
            Get.toNamed(
              "${Routes.registrationOtp}?user_id=${res.data!.user!.id}",
            );
          } else {
            ToastAlert.showErrorAlert(res.message);
          }
        }
      }
    } catch (error) {
      ToastAlert.closeAlert();
      ToastAlert.showErrorAlert("Error: $error");
      rethrow;
    }
  }


}