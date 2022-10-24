

import 'package:get/get.dart';
import 'package:load_connect/backend/models/entities/closest_vehicle_response.dart';
import 'package:load_connect/backend/services/i_util_service.dart';
import 'package:load_connect/view/providers/base_provider.dart';

class ClosestVehicleProvider extends BaseProvider {

  ClosestVehicleResponse closestVehicleResponse = ClosestVehicleResponse();
  List<Data> vehicles = [];

  void initialize() async {
    try {
      final res = await Get.find<IUtilService>().getClosestAvailableTruck('lat', 'lng');
      // closestVehicleResponse = res.data!;
      if (res.status == true) {
        closestVehicleResponse = res.data!;
        if (closestVehicleResponse.data != null) {
          vehicles = closestVehicleResponse.data!;
        }
        backToLoaded();
      } else {
        backToError("${res.data?.message}");
      }
    } catch (error) {
      backToError('Error: $error');
      rethrow;
    }
  }

  ClosestVehicleProvider() {
    initialize();
  }

  void refresh() {
    backToLoading();
    initialize();
  }
}