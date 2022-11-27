

import 'package:get/get.dart';
import 'package:load_connect/backend/models/entities/user_load.dart';
import 'package:load_connect/backend/services/i_load_service.dart';
import 'package:load_connect/view/interaction/toast_alert.dart';
import 'package:load_connect/view/providers/base_provider.dart';

class LoadDetailProvider extends BaseProvider {

  late UserLoad load;

  void acceptOffer() async {
    try {
      ToastAlert.showLoadingAlert("");
      final res = await Get.find<ILoadService>().acceptOffer(load.id!);
      ToastAlert.closeAlert();
      if (res.status == true) {
        initialize();
        ToastAlert.showAlert(res.message);
      } else {
        ToastAlert.showErrorAlert(res.message);
      }
    } catch (error) {
      ToastAlert.closeAlert();
      ToastAlert.showErrorAlert("Error: $error");
    }
  }

  void negotiateOffer(num amount) async {
    try {
      ToastAlert.showLoadingAlert("");
      final res = await Get.find<ILoadService>().negotiateOffer(load.id!, amount);
      ToastAlert.closeAlert();
      if (res.status == true) {
        initialize();
        ToastAlert.showAlert(res.message);
      } else {
        ToastAlert.showErrorAlert(res.message);
      }
    } catch (error) {
      ToastAlert.closeAlert();
      ToastAlert.showErrorAlert("Error: $error");
    }
  }

  void declineOffer() async {
    try {
      ToastAlert.showLoadingAlert("");
      final res = await Get.find<ILoadService>().declineOffer(load.id!);
      ToastAlert.closeAlert();
      if (res.status == true) {
        initialize();
        ToastAlert.showAlert(res.message);
      } else {
        ToastAlert.showErrorAlert(res.message);
      }
    } catch (error) {
      ToastAlert.closeAlert();
      ToastAlert.showErrorAlert("Error: $error");
    }
  }

  void initialize() async {
    try {
      final res = await Get.find<ILoadService>().getLoad(load.id!);
      ToastAlert.closeAlert();
      if (res.status == true) {
        load = res.data!;
        backToLoaded();
      } else {
        ToastAlert.showErrorAlert(res.message);
      }
    } catch (error) {
      ToastAlert.closeAlert();
      ToastAlert.showErrorAlert("Error: $error");
    }
  }

  LoadDetailProvider(this.load);
}