import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:load_connect_driver/backend/models/dtos/generate_token_request.dart';
import 'package:load_connect_driver/backend/models/dtos/login_request.dart';
import 'package:load_connect_driver/backend/services/core/i_local_storage.dart';
import 'package:load_connect_driver/backend/services/i_auth_service.dart';
import 'package:load_connect_driver/shared/constants.dart';
import 'package:load_connect_driver/shared/routes.dart';
import 'package:load_connect_driver/view/all_screens.dart';
import 'package:load_connect_driver/view/interaction/toast_alert.dart';
import 'package:load_connect_driver/view/providers/base_provider.dart';
import 'package:load_connect_driver/view/providers/user/user_profile_provider.dart';
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
        // print(res.message);
        if (res.status == true) {

          Get.find<ILocalStorageService>().setItem(userDataBox, userTokenKey, res.data!.token);
          Get.find<ILocalStorageService>().setItem(appDataBox, loggedInBeforeKey, true);

          if (res.data!.isDriverConfirmed! == true) {
            // print("UserToken: ${res.data!.toJson()}");
            // Provider.of<UserProfileProvider>(context, listen: false).setUser = res.data!.user!;
            Provider.of<UserProfileProvider>(context, listen: false).initialize();
            ToastAlert.showAlert("Login successful");
            Get.offAllNamed(Routes.home);
          } else {
            Get.to(KycScreen(
              onDone: () {
                Get.off(const LoginScreen());
              }, email: email, userId: res.data!.user!.id!)
            );
          }

        } else {
          ToastAlert.showErrorAlert("Error: ${res.message}");
        }
      }
    } catch (error) {
      ToastAlert.closeAlert();
      ToastAlert.showErrorAlert("Error: $error");
      rethrow;
    }
  }


}