import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/routes.dart';
import '../utils/app_dialog.dart';

void useCloseCreateTruck(BuildContext ctx) {
  AppDialog.mainDialog(
    title: "Delete Truck",
    content: "Deleting this truck will clear all information about the truck",
    // centerContent: true,
    buttonText: "Yes, Delete",
    onTap: () {
      Navigator.of(ctx).popUntil(
        (_) => Get.currentRoute == Routes.home,
      );
    },
  );
}
