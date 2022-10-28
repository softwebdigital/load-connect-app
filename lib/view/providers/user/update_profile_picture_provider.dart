

import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:load_connect/backend/services/i_auth_service.dart';
import 'package:load_connect/backend/services/i_user_service.dart';
import 'package:load_connect/view/interaction/toast_alert.dart';
import 'package:load_connect/view/providers/base_provider.dart';
import 'package:load_connect/view/providers/user/user_profile_provider.dart';
import 'package:provider/provider.dart';

class UpdateProfilePictureProvider extends BaseProvider {

  void pickImage(BuildContext context) async {
    try {
      final pickedImage = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        _uploadProfilePicture(context, File(pickedImage.path));
      } else {
        ToastAlert.showErrorAlert("You must select a profile picture to continue");
      }
    } catch(error) {
      ToastAlert.showErrorAlert("An error occurred");
    }
  }

  void _uploadProfilePicture(BuildContext context, File profilePicture) async {
    try {
      ToastAlert.showLoadingAlert("message");
      final request = dio.FormData.fromMap({
        'photo': await dio.MultipartFile.fromFile(profilePicture.path, filename: profilePicture.path)
      });

      final res = await Get.find<IUserService>().updateProfilePicture(request);
      ToastAlert.closeAlert();
      if (res.status == true) {
        ToastAlert.showAlert("Profile picture updated successfully");
        Provider.of<UserProfileProvider>(context, listen: false).initialize();
      } else {
        ToastAlert.showErrorAlert(res.message);
      }
    } catch (error) {
      ToastAlert.closeAlert();
      ToastAlert.showErrorAlert("Error: $error");
    }
  }
}