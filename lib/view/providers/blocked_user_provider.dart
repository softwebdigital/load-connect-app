

import 'package:flutter/cupertino.dart';
import 'package:get/instance_manager.dart';
import 'package:load_connect/backend/models/entities/blocked_user_model.dart';
import 'package:load_connect/backend/services/i_user_service.dart';
import 'package:load_connect/view/interaction/toast_alert.dart';
import 'package:load_connect/view/providers/base_provider.dart';

class BlockedUserProvider extends BaseProvider {

  List<BlockedUserModel> blockedUsers = [];

  BlockedUserProvider() {
    initialize();
  }

  void initialize() async {

    try {
      final res = await Get.find<IUserService>().blockedUsers();
      if (res.status == true) {
        blockedUsers = res.data!;
        backToLoaded();
      } else {
        backToError("Error: ${res.message}");
      }
    } catch (error) {
      backToError("Error: $error");
    }
  }

  void unBlockUser(BuildContext context, String uid) async {
    try {
      ToastAlert.showConfirmAlert(context, "Are you sure you want to unblock this user?", () async {
        final res = await Get.find<IUserService>().unBlockUser(uid);
        if (res.status == true) {
          ToastAlert.showAlert(res.message);
          initialize();
        } else {
          ToastAlert.showErrorAlert(res.message);
        }
      });
    } catch (error) {
      ToastAlert.showErrorAlert("Error: $error");
    }
  }

  void blockUser(BuildContext context, String uid) async {
    try {
      ToastAlert.showConfirmAlert(context, "Are you sure you want to block this user?", () async {
        final res = await Get.find<IUserService>().blockUser(uid);
        if (res.status == true) {
          ToastAlert.showAlert(res.message);
          initialize();
        } else {
          ToastAlert.showErrorAlert(res.message);
        }
      });
    } catch (error) {
      ToastAlert.showErrorAlert("Error: $error");
    }
  }

  void refresh() async {
    backToLoading();
    initialize();
  }
}