
import 'package:get/get.dart';

import '../../backend/models/entities/chat_model.dart';
import '../../backend/services/i_messaging_service.dart';
import 'base_provider.dart';

class ChatProvider extends BaseProvider {

  List<ChatModel> chats = [];
  bool isSearching = false;

  void toggleSearch() {
    isSearching = !isSearching;
    notifyListeners();
  }

  void initialize() async {
    try {
      final res = await Get.find<IMessagingService>().getChat();
      if (res.status == true) {
        chats = res.data!;
        backToLoaded();
      } else {
        backToError(res.message);
      }
    } catch (error) {
      backToError("Error: $error");
    }
  }

  ChatProvider() {
    initialize();
  }

  void reload() async {
    backToLoading();
    initialize();
  }

}