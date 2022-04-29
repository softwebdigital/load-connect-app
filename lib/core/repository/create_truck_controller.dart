import 'dart:io';

import 'package:flutter/foundation.dart' show debugPrint;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CreateTruckController extends GetxController {
  // final pickUpLocation = "".obs;
  var pickUpLocation = TextEditingController();
  final destinationLocation = TextEditingController();
  final receiverName = TextEditingController();
  final receiverPhone = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  final truckCategory = "mini-truck".obs;
  final truckCapacity = "light".obs;
  final _pickedImages = <File>[].obs;
  final isForgotPassword = true.obs;
  final _isBusy = false.obs;
  final _hideText = false.obs;

  bool get isBusy => _isBusy.value;
  List<File> get pickedImages => _pickedImages;
  set hideText(val) {
    _hideText.value = val;
  }

  @override
  void onInit() {
    super.onInit();
    debugPrint("Controller data: ${pickUpLocation.value.text}");
    // debugPrint("Forgot password controller route name: ${Get.currentRoute}");
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  void swapLocations() {
    final pickup = pickUpLocation.value.text;
    pickUpLocation.text = destinationLocation.value.text;
    destinationLocation.text = pickup;
  }

  void selectImages() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != null) {
      for (XFile image in images) {
        _pickedImages.add(File(image.path));
      }
    }
    // Image.file(File(_imageFileList![index].path))
  }

  void removeImage(int index) {
    _pickedImages.removeAt(index);
  }

  Future<bool> validateOtp() {
    _isBusy.toggle();

    return Future.delayed(const Duration(seconds: 3), () {
      _isBusy.toggle();
      return true;
    });
  }

  void returnToEmailPhone() {
    isForgotPassword.toggle();
  }
}
