

import 'package:get/get.dart';
import 'package:load_connect_driver/view/providers/base_provider.dart';

import '../../../backend/models/entities/user_load.dart';
import '../../../backend/services/i_load_service.dart';

class SavedLoadProvider extends BaseProvider {
  List<UserLoad> loads = [];


  void initialize() async {
    try {
      final res = await Get.find<ILoadService>().getDriverLoads();
      if (res.status == true) {
        loads = res.data ?? [];
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

  SavedLoadProvider() {
    initialize();
  }
}