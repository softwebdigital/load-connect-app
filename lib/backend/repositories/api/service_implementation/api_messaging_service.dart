

import 'package:dio/src/form_data.dart';
import 'package:load_connect/backend/repositories/api/core/endpoints.dart';
import 'package:load_connect/shared/constants.dart';

import '../../../models/core/service_response.dart';
import '../../../models/entities/chat_messages_model.dart';
import '../../../models/entities/chat_model.dart';
import '../../../services/i_messaging_service.dart';
import '../core/api_service.dart';

class ApiMessagingService implements IMessagingService {
  
  final apiService = ApiService();
  
  @override
  Future<ServiceResponse<List<ChatModel>>> getChat() async {
    try {
      final res = await apiService.makeGetRequest(getChatListEndpoint, {
        ...requireTokenHeader
      });
      if (res.status) {
        return ServiceResponse(
          data: List.from(res.data).map((e) => ChatModel.fromJson(e)).toList(),
          status: true, message: res.message
        );
      }
      return ServiceResponse(
        status: res.status,
        message: res.message,
      );
    } catch (error) {
      return ServiceResponse(
        status: false, message: "Error: $error"
      );
    }
  }

  @override
  Future<ServiceResponse<ChatMessagesModel>> getChatMessages(String otherUserId) async {
    try {
      final res = await apiService.makeGetRequest(getChatListEndpoint, {
        ...requireTokenHeader
      });
      if (res.status) {
        return ServiceResponse(
          data: ChatMessagesModel.fromJson(res.data),
          status: true, message: res.message
        );
      }
      return ServiceResponse(
        status: res.status,
        message: res.message,
      );
    } catch (error) {
      return ServiceResponse(
          status: false, message: "Error: $error"
      );
    }
  }

  @override
  Future<ServiceResponse> sendMessage(FormData request) async {
    try {
      final res = await apiService.makePostRequest(sendMessageEndpoint, request, {
        ...requireTokenHeader
      }, useFormData: false);
      if (res.status) {
        return ServiceResponse(
          data: ChatMessagesModel.fromJson(res.data),
          status: true, message: res.message
        );
      }
      return ServiceResponse(
        status: res.status,
        message: res.message,
      );
    } catch (error) {
      return ServiceResponse(
        status: false, message: "Error: $error"
      );
    }
  }

}