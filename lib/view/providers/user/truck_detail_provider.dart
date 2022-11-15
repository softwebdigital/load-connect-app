
import 'package:get/get.dart';
import 'package:load_connect_driver/backend/models/entities/driver_truck_model.dart';
import 'package:load_connect_driver/backend/services/i_truck_service.dart';
import 'package:load_connect_driver/view/providers/base_provider.dart';


class TruckDetailProvider extends BaseProvider {

  String truckId;
  late DriverTruckModel truck;

  TruckDetailProvider(this.truckId) {
    initialize();
  }

  void initialize() async {
    try {
      final res = await Get.find<ITruckService>().getTruck(truckId);
      if (res.status == true) {
        truck = res.data!;
        backToLoaded();
      } else {
        backToError(res.message!);
      }
    } catch (error) {
      backToError("Error: $error");
    }
  }
}