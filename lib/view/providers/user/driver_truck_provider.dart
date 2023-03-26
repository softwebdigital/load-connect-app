

import 'package:get/get.dart';
import 'package:load_connect_driver/backend/models/entities/driver_truck_model.dart';
import 'package:load_connect_driver/backend/services/i_truck_service.dart';
import 'package:load_connect_driver/view/providers/base_provider.dart';

class DriverTruckProvider extends BaseProvider {

  List<DriverTruckModel> trucks = [];
  List<DriverTruckModel> trucksToDisplay = [];

  void initialize() async {
    try {
      final res = await Get.find<ITruckService>().myTrucks();
      if (res.status == true) {
        trucks = res.data!;
        trucksToDisplay = trucks;
        backToLoaded();
      } else {
        backToError("Error: ${res.message}");
      }
    } catch (error) {
      backToError("Error: $error");
    }
  }

  void refresh() {
    backToLoading();
    initialize();
  }

  void searchTruck(String param) {
    if (param.isNotEmpty) {
      trucksToDisplay = trucks.where((element) => element.name!.toLowerCase().contains(param.toLowerCase())).toList();
    } else {
      trucksToDisplay = trucks;
    }
    notifyListeners();
  }

  DriverTruckProvider() {
    initialize();
  }
}