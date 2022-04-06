import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:load_connect/shared/routes.dart';
import 'package:load_connect/view/utils/app_dialog.dart';

void useCloseCreateLoad(BuildContext ctx) {
  AppDialog.mainDialog(
    title: "Cancel Load Creation?",
    content: "Are you sure you want to cancel the creation of this load?",
    centerContent: true,
    cancelText: "No",
    buttonText: "Yes, cancel",
    onTap: () {
      Navigator.of(ctx).popUntil(
        (_) => Get.currentRoute == Routes.home,
      );
    },
  );
}
