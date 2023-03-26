
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:load_connect_driver/backend/services/i_truck_service.dart';
import 'package:load_connect_driver/view/interaction/toast_alert.dart';
import 'package:load_connect_driver/view/providers/user/driver_truck_provider.dart';
import 'package:provider/provider.dart';
import '../../../backend/models/entities/driver_truck_model.dart';
import '../base_provider.dart';

class CreateTruckProvider extends BaseProvider {

  String currentPage = truckDetailScreen;
  String truckName = "";
  String truckPlateNumber = "";
  String truckCategory = "";
  String truckSubcategory = "";

  String truckLength = "";
  String truckWeight = "";

  List<File> truckImages = [];
  List<File> truckDoc = [];

  DriverTruckModel? truck;

  set setTruckWeight(String id) {
    truckWeight = id;
    notifyListeners();
  }

  set setTruckLength(String id) {
    truckLength = id;
    notifyListeners();
  }

  set setTruckSubCategory(String id) {
    truckSubcategory = id;
    notifyListeners();
  }

  set setTruckCategory(String id) {
    truckCategory = id;
    notifyListeners();
  }

  set setTruckName(String name) {
    truckName = name;
    notifyListeners();
  }

  set setTruckPlateNumber(String plateNumber) {
    truckPlateNumber = plateNumber;
    notifyListeners();
  }


  void selectTruckImages(BuildContext context) async {
    final pickedImages = await FilePicker.platform.pickFiles(
      allowMultiple: true, dialogTitle: "Select truck image(s)",
      type: FileType.image
    );

    if (pickedImages != null && pickedImages.files.isNotEmpty) {
      truckImages = pickedImages.files.map((e) => File(e.path!)).toList();
      notifyListeners();
    }
  }

  void removeImage(int index) {
    truckImages.removeAt(index);
    notifyListeners();
  }

  void removeDoc(int index) {
    truckDoc.removeAt(index);
    notifyListeners();
  }

  void selectTruckDocs(BuildContext context) async {
    final pickedDocs = await FilePicker.platform.pickFiles(
      allowMultiple: true, dialogTitle: "Select truck document(s)",
      type: FileType.image,
    );

    if (pickedDocs != null && pickedDocs.files.isNotEmpty) {
      truckDoc = pickedDocs.files.map((e) => File(e.path!)).toList();
      notifyListeners();
    }
  }

  void next() {
    // print(currentPage);
    if (currentPage == truckDetailScreen) {
      if (truckName.isEmpty) {
        ToastAlert.showErrorAlert("Please provide your truck name");
        return;
      }
      if (truckPlateNumber.isEmpty) {
        ToastAlert.showErrorAlert("Please provide your truck plate number");
        return;
      }
      if (truckCategory.isEmpty) {
        ToastAlert.showErrorAlert("Please select the truck category");
        return;
      }
      if (truckSubcategory.isEmpty) {
        ToastAlert.showErrorAlert("Please select the truck sub category");
        return;
      }
    }

    if (currentPage == truckCarriageSpecScreen) {
      if (truckLength.isEmpty) {
        ToastAlert.showErrorAlert("Please provide your truck length");
        return;
      }
      if (truckWeight.isEmpty) {
        ToastAlert.showErrorAlert("Please provide your truck weight");
        return;
      }
    }

    if (currentPage == truckImageScreen) {
      if (truckImages.isEmpty) {
        ToastAlert.showErrorAlert("Please provide at least 1 image of the truck");
        return;
      }
    }

    if (currentPage != truckDocumentScreen) {
      final currentIndex = screens.indexOf(currentPage);
      currentPage = screens[currentIndex + 1];
    }
    notifyListeners();
  }

  void back() {
    if (currentPage != truckDetailScreen) {
      final currentIndex = screens.indexOf(currentPage);
      currentPage = screens[currentIndex - 1];
    }
    notifyListeners();
  }

  void createTruck(BuildContext context) async {
    try {
      if (truckImages.isEmpty) {
        ToastAlert.showErrorAlert("Please provide truck document");
      } else {
        ToastAlert.showLoadingAlert('');
        final request = dio.FormData.fromMap({
          'name': truckName,
          'plate_number': truckPlateNumber,
          'truck_category_id': truckCategory,
          'sub_category': truckSubcategory,
          'truck_type_id': truckSubcategory,
          'max_length': truckLength,
          'max_weight': truckWeight,
          'truck_images[]': truckImages.map((e) => dio.MultipartFile.fromFileSync(e.path)).toList(),
          'truck_documents[]': truckDoc.map((e) => dio.MultipartFile.fromFileSync(e.path)).toList()
        });
        final res = await Get.find<ITruckService>().createTruck(request);
        ToastAlert.closeAlert();
        if (res.status == true) {
          Provider.of<DriverTruckProvider>(context, listen: false).initialize();
          ToastAlert.showAlert("Truck created successfully");
          Get.back();
        } else {
          ToastAlert.showErrorAlert(res.message);
        }
      }

    } catch (error) {
      ToastAlert.closeAlert();
      ToastAlert.showAlert("Error: $error");
    }
  }

  CreateTruckProvider([this.truck]) {
    if (truck != null) {
      truckName = truck!.name!;
      truckWeight = truck!.maxWeight!;
      truckLength = truck!.maxLength!;
      truckSubcategory = truck!.subCategory!;
      truckCategory = truck!.category!;
      notifyListeners();
    }
  }

}

const truckDetailScreen = "truck_detail";
const truckCarriageSpecScreen = "truck_carriage_spec";
const truckImageScreen = "truck_image";
const truckDocumentScreen = "truck_document";

List screens = [
  truckDetailScreen,
  truckCarriageSpecScreen,
  truckImageScreen,
  truckDocumentScreen
];