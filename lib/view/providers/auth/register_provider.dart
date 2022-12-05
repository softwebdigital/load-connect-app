

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:load_connect/backend/models/dtos/create_account_request.dart';
import 'package:load_connect/backend/models/dtos/generate_token_request.dart';
import 'package:load_connect/backend/services/core/i_local_storage.dart';
import 'package:load_connect/backend/services/i_auth_service.dart';
import 'package:load_connect/shared/constants.dart';
import 'package:load_connect/shared/routes.dart';
import 'package:load_connect/view/interaction/toast_alert.dart';
import 'package:load_connect/view/providers/base_provider.dart';

class RegisterProvider extends BaseProvider {

  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  String _firstName = '';
  String _lastName = '';
  String _phoneNumber = '';

  bool _passwordIsVisible = false;
  bool _confirmPasswordIsVisible = false;
  String get email => _email;
  String get password => _password;
  String get confirmPassword => _confirmPassword;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get phoneNumber => _phoneNumber;

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

  set setEmail(String value) {
    _email = value;
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
  set setFirstName(String value) {
    _firstName = value;
    notifyListeners();
  }
  set setLastName(String value) {
    _lastName = value;
    notifyListeners();
  }

  set setPhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  void register(BuildContext context, String usertype) async {
    try {
      // Get.find<OverwoodRoute>().replaceAll([const HomeScreen()]);
      if (_password.isEmpty || _email.isEmpty) {
        ToastAlert.showErrorAlert("Email and Password field's are required to continue");
      } else {
        ToastAlert.showLoadingAlert("");
        final res = await Get.find<IAuthService>().createAccount(CreateAccountRequest(
          email: _email,
          password: _password,
          phone: _phoneNumber,
          lastName: _lastName,
          firstName: _firstName,
          accountType: "user"
        ));
        ToastAlert.closeAlert();
        if (res.status == true) {
          // res.data!.
          Get.find<ILocalStorageService>().setItem(appDataBox, loggedInBeforeKey, true);
          // final generateTokenRequest = GenerateTokenRequest(
          //   type: "register",
          //   userId: res.data!.id
          // );
          // await Get.find<IAuthService>().generateToken(generateTokenRequest);

          ToastAlert.showAlert("Registration successful");
          Get.toNamed(
            "${Routes.registrationOtp}?user_id=${res.data!.id}&type=register&email=$email&name=$firstName",
          );
        } else {
          if (res.message.contains('unverified')) {
            ToastAlert.showErrorAlert("Account not verified");
            Get.toNamed(
              "${Routes.registrationOtp}?user_id=${res.data!.id}",
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