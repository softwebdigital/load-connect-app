

import 'package:get/get.dart';
import 'package:load_connect/backend/models/entities/user_load.dart';
import 'package:load_connect/backend/services/i_load_service.dart';
import 'package:load_connect/view/providers/base_provider.dart';

class LoadProvider extends BaseProvider {
  List<UserLoad> loads = [];


  void initialize() async {
    try {
      final res = await Get.find<ILoadService>().getUserLoads();
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
  LoadProvider() {
    initialize();
  }
}