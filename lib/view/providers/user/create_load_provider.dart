

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:load_connect/shared/constants.dart';
import 'package:load_connect/shared/routes.dart';
import 'package:load_connect/view/interaction/toast_alert.dart';
import 'package:load_connect/view/providers/base_provider.dart';

class CreateLoadProvider extends BaseProvider {

  String currentScreen = selectLoadLocationScreen;

  String pickupAddress = "";
  double pickupLat = 0.0;
  double pickupLng = 0.0;

  String destinationAddress = "";
  double destinationLat = 0.0;
  double destinationLng = 0.0;

  String loadName = "";
  String loadDescription = "";

  String vehicleType = "";
  String vehicleTypeId = "";

  String capacity = "";

  String receiverName = "";
  String receiverPhoneNumber = "";

  List<File> images = [];

  set setVehicleCapacity(String cap) {
    capacity = cap;
    notifyListeners();
  }

  set setReceiverPhoneNumber(String p) {
    receiverPhoneNumber = p;
    notifyListeners();
  }


  void createLoad(BuildContext context) async {
    try {

    } catch (error) {
      ToastAlert.showErrorAlert("Error: $error");
    }
  }

  void swapLocation() {}

  void back() {
    if (currentScreen != selectLoadLocationScreen) {
      final currentIndex = screens.indexOf(currentScreen);
      currentScreen = screens[currentIndex - 1];
    }

    notifyListeners();
  }

  void next() {
    if (currentScreen != addOtherLoadInfoScreen) {
      final currentIndex = screens.indexOf(currentScreen);
      currentScreen = screens[currentIndex + 1];
    }

    notifyListeners();
  }

}

List screens = [
  selectLoadLocationScreen,
  addLoadDetailScreen,
  addLoadImageScreen,
  addLoadReceiverInfoScreen,
  addOtherLoadInfoScreen
];