
import 'package:get/get.dart';
import 'package:load_connect/backend/models/entities/notification_model.dart';
import 'package:load_connect/backend/services/i_notification_service.dart';
import 'package:load_connect/view/providers/base_provider.dart';

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

  NotificationProvider() {
    initialize();
  }
}