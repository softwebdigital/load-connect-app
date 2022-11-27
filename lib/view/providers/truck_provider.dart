

import 'package:get/get.dart';
import 'package:load_connect/backend/services/i_truck_service.dart';
import 'package:load_connect/view/interaction/toast_alert.dart';

import '../../backend/models/entities/vehicle_model.dart';
import '../screens/widgets/sort_trucks.dart';
import 'base_provider.dart';

class TruckProvider extends BaseProvider {

  List<VehicleModel> trucks = [];
  List<VehicleModel> trucksToDisplay = [];

  SortTerm sortBy = SortTerm.Newest;

  void initialize() async {
    try {
      final res = await Get.find<ITruckService>().getVehicles();
      if (res.status == true) {
        trucks = res.data!;
        trucksToDisplay = trucks;
        backToLoaded();
      } else {
        backToError(res.message);
      }
    } catch (error) {
      backToError("Error: $error");
      rethrow;
    }
  }

  TruckProvider() {
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

  void sortTruck(SortTerm sortTerm) {
    sortBy = sortTerm;
    backToLoading();
    if (sortBy == SortTerm.Newest) {
      trucksToDisplay = trucks;
    }
    if (sortBy == SortTerm.DateDelivered) {
      trucksToDisplay.sort((a, b) => DateTime.parse(a.updatedAt!).isBefore(DateTime.parse(b.updatedAt!)) ? 0 :1);
    }
    if (sortBy == SortTerm.DriverAtoZ) {
      // trucksToDisplay.sort((a, b) => DateTime.parse(a.updatedAt!).isBefore(DateTime.parse(b.updatedAt!)) ? 0 :1);
      trucksToDisplay.sort((a, b) => "${a.user!.firstName} ${a.user!.lastName}".compareTo("${b.user!.firstName} ${b.user!.lastName}"));
    }
    if (sortBy == SortTerm.LoadAtoZ) {
      trucksToDisplay.sort((a, b) => a.name!.compareTo(b.name!));
    }
    backToLoaded();
  }
}

