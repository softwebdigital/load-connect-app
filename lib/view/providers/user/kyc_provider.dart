

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:load_connect_driver/backend/services/i_user_service.dart';
import 'package:load_connect_driver/view/interaction/toast_alert.dart';
import 'package:load_connect_driver/view/providers/base_provider.dart';

class UploadKYCProvider extends BaseProvider {

  String kycType = "";
  File? kycDoc;


  void uploadKycDoc(BuildContext context, Function onDone) async {
    try {
      if (kycType.isEmpty) {
        ToastAlert.showErrorAlert("Please select a document type");
      } else if (kycDoc == null) {
        ToastAlert.showErrorAlert("Please select a document file");
      } else {
        final request = FormData.fromMap({
          "document_type": kycType,
          "photo": MultipartFile.fromFileSync(kycDoc!.path, filename: "doc")
        });
        final res = await Get.find<IUserService>().uploadKycDocument(request);
        ToastAlert.closeAlert();
        if (res.status == true) {
          ToastAlert.showAlert(res.message);
          onDone();
        } else {
          ToastAlert.showErrorAlert("Error: ${res.message}");
        }
      }
    } catch (error) {
      ToastAlert.closeAlert();
      ToastAlert.showErrorAlert("Error: $error");
    }
  }


  void selectKycDoc() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        kycDoc = File(result.files.first.path!);
      } else {
        ToastAlert.showErrorAlert("You must select a profile picture to continue");
      }
    } catch(error) {
      ToastAlert.showErrorAlert("An error occurred");
    }
  }
}