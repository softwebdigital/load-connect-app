


import 'package:get/get.dart';

import '../../../backend/models/dtos/notification_settings_request.dart';
import '../../../backend/models/entities/notification_settings_model.dart';
import '../../../backend/services/i_user_service.dart';
import '../../interaction/toast_alert.dart';
import '../base_provider.dart';


class NotificationSettingsProvider extends BaseProvider {

  bool offerReceived = false;
  bool offerAccepted = false;
  bool loadPickedUp = false;
  bool loadDelivered = false;
  bool deliveryError = false;

  bool allMessages = false;
  bool fromActiveLoadsOnly = false;
  bool fromLoadConnect = false;
  bool allNotification = false;

  void initialize() async {
    try {
      final res = await Get.find<IUserService>().getNotificationSettings();
      if (res.status == true) {
        final notificationSettings = res.data!;
        _set(notificationSettings);
        backToLoaded();
      } else {
        backToError("Error: ${res.message}");
      }
    } catch (error) {
      backToError("Error: $error");
    }
  }

  void _set(NotificationSettingsModel notificationSettings) {
    allMessages = notificationSettings.allMessages == 1;
    offerAccepted = notificationSettings.offerAccepted == 1;
    offerReceived = notificationSettings.offerRecieved == 1;
    loadPickedUp = notificationSettings.loadPickedUp == 1;
    loadDelivered = notificationSettings.loadDelivered == 1;
    fromActiveLoadsOnly = notificationSettings.fromActiveLoadsOnly == 1;
    fromLoadConnect = notificationSettings.fromLoadConnect == 1;
    allNotification = (allMessages && offerAccepted && offerReceived && loadPickedUp && loadDelivered && fromActiveLoadsOnly && fromLoadConnect);
  }

  void updateNotificationSettings() async {
    try {
      final request = NotificationSettingsRequest(
        allMessages: allMessages ? 1 : 0,
        deliveryErrors: deliveryError ? 1 : 0,
        offerAccepted: offerAccepted ? 1 : 0,
        offerRecieved: offerReceived ? 1 : 0,
        loadPickedUp: loadPickedUp ? 1 : 0,
        loadDelivered: loadDelivered ? 1 : 0,
        fromActiveLoadsOnly: fromActiveLoadsOnly  ? 1 : 0,
        fromLoadConnect: fromLoadConnect ? 1 : 0,
      );

      final res = await Get.find<IUserService>().updateNotificationSettings(request);
      if (res.status) {
        _set(res.data!);
        ToastAlert.showAlert(res.message);
      } else {
        ToastAlert.showErrorAlert(res.message);
      }

    } catch (error) {
      ToastAlert.showErrorAlert("Error: $error");
    }
  }

  void setAllNotification() {
    allNotification = !allNotification;
    offerAccepted = allNotification;
    offerReceived = allNotification;
    loadPickedUp = allNotification;
    loadDelivered = allNotification;
    deliveryError = allNotification;
    allMessages = allNotification;
    fromActiveLoadsOnly = allNotification;
    fromLoadConnect = allNotification;
    notifyListeners();
  }

  NotificationSettingsProvider() {
    initialize();
  }
}
