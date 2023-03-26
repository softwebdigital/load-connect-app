
import 'package:get/get.dart';

import '../../backend/models/entities/chat_messages_model.dart';
import '../../backend/services/i_messaging_service.dart';
import 'base_provider.dart';


class ChatMessagesProvider extends BaseProvider {

  late ChatMessagesModel chatMessages;
  late String userId;

  void initialize() async {
    try {
      final res = await Get.find<IMessagingService>().getChatMessages(userId);
      if (res.status == true) {
        chatMessages = res.data!;
        backToLoaded();
      } else {
        backToError(res.message);
      }
    } catch (error) {
      backToError("Error: $error");
    }
  }

  ChatMessagesProvider(this.userId) {
    initialize();
  }

  void reload() async {
    backToLoading();
    initialize();
  }

}