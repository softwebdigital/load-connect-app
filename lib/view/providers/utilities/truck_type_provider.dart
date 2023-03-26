


import 'package:get/get.dart';
import 'package:load_connect_driver/backend/services/i_truck_service.dart';

import '../../../backend/models/entities/truck_type_model.dart';
import '../base_provider.dart';

class TruckTypeProvider extends BaseProvider {
  List<TruckTypeModel> truckTypes = [];

  TruckTypeProvider() {
    initialize();
  }

  void initialize() async {
    try {
      final res = await Get.find<ITruckService>().getTruckTypes();
      if (res.status == true) {
        truckTypes = res.data!;
        backToLoaded();
      } else {
        backToError(res.message);
      }
    } catch (error) {
      backToError("$error");
    }
  }
}