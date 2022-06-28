

import 'package:get/get.dart';
import 'package:load_connect/backend/models/entities/full_profile_model.dart';
import 'package:load_connect/backend/models/entities/user_model.dart';
import 'package:load_connect/backend/services/i_user_service.dart';
import 'package:load_connect/shared/routes.dart';
import 'package:load_connect/view/interaction/toast_alert.dart';
import 'package:load_connect/view/providers/base_provider.dart';

class UserProfileProvider extends BaseProvider {

  late UserModel user;
  FullProfileModel? profile;

  set setUser(UserModel usr) {
    user = usr;
    notifyListeners();
  }

  void initialize() async {
    try {
      final res = await Get.find<IUserService>().getFullProfile();
      if (res.status) {
        user = UserModel.fromJson(res.data!.user!.toJson());
        profile = res.data!;
        backToLoaded();
      } else {
        ToastAlert.showErrorAlert(res.message);
        Get.offAllNamed(Routes.login);
      }
    } catch (error) {
      ToastAlert.showErrorAlert('Error: $error');
      Get.offAllNamed(Routes.login);
      rethrow;
    }
  }

  UserProfileProvider() {
    initialize();
  }

}