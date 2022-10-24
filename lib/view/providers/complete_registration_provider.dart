

import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:load_connect/view/interaction/toast_alert.dart';
import 'package:load_connect/view/providers/base_provider.dart';

class CompleteRegistrationProvider extends BaseProvider {

  String state = "";
  String address = "";
  File? document;

  void pickDocument() async {
    try {
      final doc = await ImagePicker.platform.pickImage(source: ImageSource.camera);
      if (doc != null) {
        document = File(doc.path);
        notifyListeners();
      }
    } catch (error) {
      ToastAlert.closeAlert();
      ToastAlert.showErrorAlert("Error: $error");
    }
  }

}
