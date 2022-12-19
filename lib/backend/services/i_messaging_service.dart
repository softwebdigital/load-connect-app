import 'package:dio/dio.dart';

import '../models/core/service_response.dart';
import '../models/entities/chat_messages_model.dart';
import '../models/entities/chat_model.dart';

abstract class IMessagingService {
  Future<ServiceResponse> sendMessage(FormData request);
  Future<ServiceResponse<ChatMessagesModel>> getChatMessages(String otherUserId);
  Future<ServiceResponse<List<ChatModel>>> getChat();
}