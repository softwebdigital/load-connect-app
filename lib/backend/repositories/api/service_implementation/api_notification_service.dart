

import 'package:load_connect/backend/models/core/service_response.dart';
import 'package:load_connect/backend/models/entities/notification_model.dart';
import 'package:load_connect/backend/repositories/api/core/endpoints.dart';
import 'package:load_connect/backend/services/i_notification_service.dart';

import '../../../../shared/constants.dart';
import '../core/api_service.dart';

class ApiNotificationService implements INotificationService {

  final apiService = ApiService();

  @override
  Future<ServiceResponse<NotificationModel>> getNotification(String noteId) async {
    try {
      final res = await apiService.makeGetRequest(getNotificationEndpoint(noteId), {
        ...requireTokenHeader
      });
      if (res.status == true) {
        return ServiceResponse(
          status: res.status,
          message: res.message,
          data: NotificationModel.fromJson(res.data['data'])
        );
      }

      return ServiceResponse(
          status: res.status,
          message: res.message,
          data: null
      );
    } catch (error) {
      return ServiceResponse(status: false, message: "Error: $error");
    }
  }

  @override
  Future<ServiceResponse<List<NotificationModel>>> getNotifications() async {
    try {
      final res = await apiService.makeGetRequest(getAllNotificationsEndpoint, {
        ...requireTokenHeader
      });
      if (res.status == true) {
        return ServiceResponse(
            status: res.status,
            message: res.message,
            data: List.from(res.data['data']['notifications']).map((e) => NotificationModel.fromJson(e)).toList()
        );
      }

      return ServiceResponse(
        status: res.status,
        message: res.message,
        data: null
      );
    } catch (error) {
      return ServiceResponse(status: false, message: "Error: $error");
    }
  }

  @override
  Future<ServiceResponse<String>> markAllNotificationAsRead() async {
    try {
      final res = await apiService.makePutRequest(markAllNotificationAsReadEndpoint, {}, {
        ...requireTokenHeader
      });
      if (res.status == true) {
        return ServiceResponse(
            status: res.status,
            message: res.message,
            data: res.message
        );
      }

      return ServiceResponse(
          status: res.status,
          message: res.message,
          data: null
      );
    } catch (error) {
      return ServiceResponse(status: false, message: "Error: $error");
    }
  }

  @override
  Future<ServiceResponse<String>> markNotificationAsRead(String noteId) async {
    try {
      final res = await apiService.makePutRequest(markNotificationAsReadEndpoint(noteId), {}, {
        ...requireTokenHeader
      });
      if (res.status == true) {
        return ServiceResponse(
            status: res.status,
            message: res.message,
            data: res.message
        );
      }

      return ServiceResponse(
          status: res.status,
          message: res.message,
          data: null
      );
    } catch (error) {
      return ServiceResponse(status: false, message: "Error: $error");
    }
  }

}