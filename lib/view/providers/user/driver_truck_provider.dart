

import 'package:get/get.dart';
import 'package:load_connect_driver/backend/models/entities/driver_truck_model.dart';
import 'package:load_connect_driver/backend/services/i_truck_service.dart';
import 'package:load_connect_driver/view/providers/base_provider.dart';

class DriverTruckProvider extends BaseProvider {

  List<DriverTruckModel> trucks = [];

  void initialize() async {
    try {
      final res = await Get.find<ITruckService>().myTrucks();
      if (res.status == true) {
        trucks = res.data!;
        backToLoaded();
      } else {
        backToError("Error: ${res.message}");
      }
    } catch (error) {
      backToError("Error: $error");
    }
  }

  DriverTruckProvider() {
    initialize();
  }
}