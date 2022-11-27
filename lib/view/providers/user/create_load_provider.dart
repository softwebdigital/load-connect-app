

import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:load_connect/backend/services/i_load_service.dart';
import 'package:load_connect/shared/constants.dart';
import 'package:load_connect/shared/routes.dart';
import 'package:load_connect/view/interaction/toast_alert.dart';
import 'package:load_connect/view/providers/base_provider.dart';
import 'package:load_connect/view/providers/user/load_provider.dart';
import 'package:load_connect/view/providers/user/user_profile_provider.dart';
import 'package:provider/provider.dart';

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

  String loadWeight = "";
  String loadValue = "";
  String pickUpDate = "";
  String pickUpDateDeadline = "";

  set setPickupDate(String pkd) {
    pickUpDate = pkd;
    notifyListeners();
  }

  set setPickupDateDeadline(String pkd) {
    pickUpDateDeadline = pkd;
    notifyListeners();
  }

  set setVehicleCapacity(String cap) {
    capacity = cap;
    notifyListeners();
  }

  set setVehicleTypeId(String vtid) {
    vehicleTypeId = vtid;
    notifyListeners();
  }

  set setReceiverPhoneNumber(String p) {
    receiverPhoneNumber = p;
    // notifyListeners();
  }

  void pickLoadImages() async {
    final pickedImages = await ImagePicker.platform.pickMultiImage();
    if (pickedImages!.isNotEmpty) {
      images = pickedImages.map((e) => File(e.path)).toList();
      notifyListeners();
    }
  }

  void removeImage(File index) {
    images.remove(index);
    notifyListeners();
  }

  void createLoad(BuildContext context) async {
    try {
      ToastAlert.showLoadingAlert("");
      final formData = dio.FormData.fromMap({
        'pickup_address': pickupAddress,
        'pickup_location_coordinate_lat': pickupLat,
        'pickup_location_coordinate_long': pickupLng,
        'destination_address': destinationAddress,
        'destination_coordinate_lat': destinationLat,
        'destination_coordinate_long': destinationLng,

        'load_name': loadName,
        'description': loadDescription,
        // 'truck_category': vehicleType,

        'truck_category': vehicleTypeId,
        'pickup_date': pickUpDate,
        'pickup_deadline_date': pickUpDateDeadline,
        'load_weight': loadWeight,
        'load_value': loadValue,
        'destination': destinationAddress,
        'pickup_location': pickupAddress,

        'receiver_name': receiverName,
        'receiver_phone': receiverPhoneNumber,
        'truck_capacity': capacity,
        'load_images[]': images.map((e) => dio.MultipartFile.fromFileSync((e.path))).toList()
      });
      // print(formData);
      final res = await Get.find<ILoadService>().createLoad(formData);
      ToastAlert.closeAlert();
      if (res.status == true) {
        ToastAlert.showAlert("Load Created Successfully");
        Get.offAllNamed(Routes.home);
        Provider.of<LoadProvider>(context, listen: false).initialize();
      } else {
        ToastAlert.showErrorAlert(res.message);
      }
    } catch (error) {
      ToastAlert.showErrorAlert("Error: $error");
    }
  }

  void swapLocation() {
    /// Swap Address
    final tempAddress = pickupAddress;
    pickupAddress = destinationAddress;
    destinationAddress = tempAddress;

    /// Swap latitude
    final tempLat = pickupLat;
    pickupLat = destinationLat;
    destinationLat = tempLat;

    /// Swap longitude
    final tempLng = pickupLng;
    pickupLng = destinationLng;
    destinationLng = tempLng;

    notifyListeners();
  }

  void back() {
    if (currentScreen != selectLoadLocationScreen) {
      final currentIndex = screens.indexOf(currentScreen);
      currentScreen = screens[currentIndex - 1];
    }

    notifyListeners();
  }

  void next() {
    if (currentScreen == selectLoadLocationScreen) {
      if (pickupAddress.isEmpty) {
        ToastAlert.showErrorAlert("Please select a pickup address");
        return;
      }
      if (destinationAddress.isEmpty) {
        ToastAlert.showErrorAlert("Please select a destination address");
        return;
      }
    }

    if (currentScreen == addLoadDetailScreen) {
      if (loadName.isEmpty) {
        ToastAlert.showErrorAlert("Please provide a load name");
        return;
      }
      if (loadDescription.isEmpty) {
        ToastAlert.showErrorAlert("Please provide $loadName's description");
        return;
      }
      if (loadDescription.isEmpty) {
        ToastAlert.showErrorAlert("Please provide $loadName's weight");
        return;
      }
      if (vehicleTypeId.isEmpty) {
        ToastAlert.showErrorAlert("Please select vehicle type");
        return;
      }
      if (capacity.isEmpty) {
        ToastAlert.showErrorAlert("Please select vehicle capacity");
        return;
      }
    }

    if (currentScreen == addLoadImageScreen) {
      if (images.isEmpty) {
        ToastAlert.showErrorAlert("Please select load image(s).");
        return;
      }
    }

    if (currentScreen == addLoadReceiverInfoScreen) {
      if (receiverName.isEmpty) {
        ToastAlert.showErrorAlert("Please provide receiver's name");
        return;
      }
      if (receiverPhoneNumber.isEmpty) {
        ToastAlert.showErrorAlert("Please provide receiver's phone number");
        return;
      }
    }

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