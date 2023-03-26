


import 'package:get/get.dart';
import 'package:load_connect_driver/backend/models/entities/truck_category_model.dart';
import 'package:load_connect_driver/backend/services/i_truck_service.dart';

import '../base_provider.dart';

class TruckCategoriesProvider extends BaseProvider {
  List<TruckCategoryModel> truckCategories = [];

  TruckCategoriesProvider() {
    initialize();
  }

  void initialize() async {
    try {
      final res = await Get.find<ITruckService>().getTruckCategories();
      if (res.status == true) {
        truckCategories = res.data!;
        backToLoaded();
      } else {
        backToError(res.message);
      }
    } catch (error) {
      backToError("$error");
    }
  }
}