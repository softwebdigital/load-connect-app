import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:load_connect_driver/backend/models/dtos/edit_profile_request.dart';
import 'package:load_connect_driver/backend/models/entities/user_model.dart';
import 'package:load_connect_driver/backend/services/i_user_service.dart';
import 'package:load_connect_driver/view/interaction/toast_alert.dart';
import 'package:load_connect_driver/view/providers/base_provider.dart';
import 'package:load_connect_driver/view/providers/user/user_profile_provider.dart';
import 'package:provider/provider.dart';

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
        // await Get.find<IAuthService>().completeProfile(dio.FormData.fromMap({
        //   'state': state,
        //   'address': address
        // })).then((value) {
        //   print("CompleteProfileMessage: ${value.message}");
        // });
        final user = Provider.of<UserProfileProvider>(context, listen: false).user;
        ToastAlert.showLoadingAlert("");
        final request = EditProfileRequest(
            firstName: firstName,
            lastName: lastName,
            address: address,
            state: state,
            email: user.email,
            phone: user.phone
        );
        final res = await Get.find<IUserService>().editProfile(request);
        ToastAlert.closeAlert();
        if (res.status == true) {
          ToastAlert.showAlert("Profile updated successfully");
          Provider.of<UserProfileProvider>(context, listen: false).initialize();
          Get.back();
        } else {
          ToastAlert.showErrorAlert(res.message);
        }
      }
    } catch (error) {
      ToastAlert.closeAlert();
    }
  }

  UpdateProfileProvider(this.user) {
    print("User: ${user.toJson()}");
    firstName = user.firstName!;
    lastName = user.lastName!;
  }

}