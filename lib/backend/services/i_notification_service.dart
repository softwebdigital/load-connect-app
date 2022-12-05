

import '../models/core/service_response.dart';
import '../models/entities/notification_model.dart';

abstract class INotificationService {
  Future<ServiceResponse<List<NotificationModel>>> getNotifications();
  Future<ServiceResponse<NotificationModel>> getNotification(String noteId);
  Future<ServiceResponse<String>> markNotificationAsRead(String noteId);
  Future<ServiceResponse<String>> markAllNotificationAsRead();
}