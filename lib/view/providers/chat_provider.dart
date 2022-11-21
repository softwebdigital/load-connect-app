
import 'package:get/get.dart';
import 'package:load_connect/backend/services/i_user_service.dart';
import 'package:load_connect/view/providers/base_provider.dart';

class ChatProvider extends BaseProvider {

  List chats = [];

  void initialize() async {
    try {
      await Future.delayed(const Duration(seconds: 10));
      // final res = await Get.find<IUserService>().getChats90
      chats = List.generate(10, (index) => "Last Message 0").toList();
      backToLoaded();
    } catch (error) {
      backToError("Error: $error");
    }
  }

  ChatProvider() {
    initialize();
  }

}