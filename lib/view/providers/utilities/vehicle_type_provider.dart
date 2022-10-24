

import 'package:get/get.dart';
import 'package:load_connect/backend/models/entities/vehicle_type_model.dart';
import 'package:load_connect/backend/services/i_util_service.dart';
import 'package:load_connect/view/providers/base_provider.dart';

class VehicleTypeProvider extends BaseProvider {
  List<VehicleTypeModel> vehicleTypes = [];

  void initialize() async {
    try {
      backToLoading();
      final res = await Get.find<IUtilService>().getVehicleTypes();
      if (res.status) {
        vehicleTypes = res.data ?? [];
        backToLoaded();
      } else {
        backToError(res.message);
      }
    } catch (error) {
      backToError("Error: $error");
      rethrow;
    }
  }

  VehicleTypeProvider() {
    initialize();
  }
}