

import 'package:get/get.dart';

import '../../../backend/models/entities/notification_model.dart';
import '../../../backend/services/i_notification_service.dart';
import '../../interaction/toast_alert.dart';
import '../base_provider.dart';

class NotificationProvider extends BaseProvider {

  List<NotificationModel> notifications = [];

  void initialize() async {
    try {
      final res = await Get.find<INotificationService>().getNotifications();
      if (res.status == true) {
        notifications = res.data!;
        backToLoaded();
      } else {
        backToError("Error: ${res.message}");
      }
    } catch (error) {
      backToError("Error: $error");
    }
  }

  void markAllNotificationAsRead() async {
    try {
      ToastAlert.showLoadingAlert("");
      final res = await Get.find<INotificationService>().markAllNotificationAsRead();
      ToastAlert.closeAlert();
      if (res.status == true) {
        ToastAlert.showAlert(res.message);
        initialize();
      } else {
        ToastAlert.showErrorAlert(res.message);
      }
    } catch (error) {
      ToastAlert.showErrorAlert("Error: $error");
    }
  }

  void markNotificationAsRead(String id) async {
    try {
      // ToastAlert.showLoadingAlert("");
      final res = await Get.find<INotificationService>().markNotificationAsRead(id);
      // ToastAlert.closeAlert();
      if (res.status == true) {
        // ToastAlert.showAlert(res.message);
        initialize();
      } else {
        ToastAlert.showErrorAlert(res.message);
      }
    } catch (error) {
      ToastAlert.showErrorAlert("Error: $error");
    }
  }

  NotificationProvider() {
    initialize();
  }
}