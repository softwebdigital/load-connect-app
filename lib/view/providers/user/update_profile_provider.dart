

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:load_connect/backend/models/dtos/edit_profile_request.dart';
import 'package:load_connect/backend/models/entities/user_model.dart';
import 'package:load_connect/backend/services/i_user_service.dart';
import 'package:load_connect/view/interaction/toast_alert.dart';
import 'package:load_connect/view/providers/base_provider.dart';

class UpdateProfileProvider extends BaseProvider {

  String firstName = "";
  String lastName = "";
  String state = "";
  String address = "";

  UserModel user;


  void updateProfile(BuildContext context) async {
    try {
      if (firstName.isEmpty) {
        ToastAlert.showErrorAlert("Please provide your first name");
      } else if (lastName.isEmpty) {
        ToastAlert.showErrorAlert("Please provide your last name");
      } else if (state.isEmpty) {
        ToastAlert.showErrorAlert("Please provide your state of residence");
      } else if (address.isEmpty) {
        ToastAlert.showErrorAlert("Please provide your address of residence");
      } else {
        ToastAlert.showLoadingAlert("");
        final request = EditProfileRequest(
          firstName: firstName,
          lastName: lastName,
          address: address,
          state: state
        );
        final res = await Get.find<IUserService>().editProfile(request);
        ToastAlert.closeAlert();
        if (res.status == true) {
          ToastAlert.showAlert(res.message);
        } else {
          ToastAlert.showErrorAlert(res.message);
        }
      }
    } catch (error) {
      ToastAlert.closeAlert();
    }
  }

  UpdateProfileProvider(this.user) {
    firstName = user.firstName!;
    lastName = user.lastName!;
    state = user.more == null ? "" : user.more['state'];
    address = user.more == null ? "" : user.more['address'];
  }

}