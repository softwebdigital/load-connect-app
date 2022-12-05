
import 'package:load_connect/backend/models/entities/notification_model.dart';

import '../models/core/service_response.dart';

abstract class INotificationService {
  Future<ServiceResponse<List<NotificationModel>>> getNotifications();
  Future<ServiceResponse<NotificationModel>> getNotification(String noteId);
  Future<ServiceResponse<String>> markNotificationAsRead(String noteId);
  Future<ServiceResponse<String>> markAllNotificationAsRead();
}