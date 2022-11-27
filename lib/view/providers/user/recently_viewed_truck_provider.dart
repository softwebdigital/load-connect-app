

import 'package:get/get.dart';
import 'package:load_connect/backend/services/i_truck_service.dart';
import 'package:load_connect/view/interaction/toast_alert.dart';

import '../../../backend/models/entities/vehicle_model.dart';
import '../base_provider.dart';


class RecentlyViewedTruckProvider extends BaseProvider {

  List<VehicleModel> trucks = [];

  void initialize() async {
    try {
      final res = await Get.find<ITruckService>().getRecentlyViewedVehicles();
      if (res.status == true) {
        trucks = res.data!;
        backToLoaded();
      } else {
        backToError(res.message);
      }
    } catch (error) {
      backToError("Error: $error");
      rethrow;
    }
  }

  RecentlyViewedTruckProvider() {
    initialize();
  }

  void refresh() async {
    backToLoading();
    initialize();
  }

  void saveTruck(String id) async {
    try {
      ToastAlert.showLoadingAlert("");
      final res = await Get.find<ITruckService>().saveTruck(id);
      ToastAlert.closeAlert();
      if (res.status == true) {
        ToastAlert.showAlert(res.data!);
      }
    } catch(error) {
      ToastAlert.closeAlert();
      ToastAlert.showErrorAlert("Error: $error");
    }
  }
}