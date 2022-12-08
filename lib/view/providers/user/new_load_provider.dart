

import 'package:get/get.dart';
import 'package:load_connect_driver/shared/routes.dart';
import 'package:load_connect_driver/view/all_screens.dart';
import 'package:load_connect_driver/view/providers/base_provider.dart';

import '../../../backend/models/entities/user_load.dart';
import '../../../backend/services/i_load_service.dart';

class NewLoadProvider extends BaseProvider {
  List<UserLoad> loads = [];


  void initialize() async {
    try {
      final res = await Get.find<ILoadService>().getNewLoads();
      print(res.status);
      if (res.status == true) {
        loads = res.data ?? [];
        backToLoaded();
      } else {
        if (res.message.toLowerCase().contains('unauthenticated')) {
          Get.offAll(const LoginScreen());
        }
        backToError("Error: ${res.message}");
      }
    } catch (error) {
      print("Something shele");
      backToError("Error: $error");
      Get.offAll(const LoginScreen());
    }
  }


  void refresh() {
    backToLoading();
    initialize();
  }
  NewLoadProvider() {
    initialize();
  }
}