import 'package:get/get.dart';
import 'package:load_connect_driver/backend/models/entities/full_profile_model.dart';
import 'package:load_connect_driver/backend/models/entities/order_model.dart';
import 'package:load_connect_driver/backend/models/entities/user_model.dart';
import 'package:load_connect_driver/backend/services/i_user_service.dart';
import 'package:load_connect_driver/shared/routes.dart';
import 'package:load_connect_driver/view/interaction/toast_alert.dart';
import 'package:load_connect_driver/view/providers/base_provider.dart';

class UserProfileProvider extends BaseProvider {

  late UserModel user;
  // FullProfileModel? profile;
  List<OrderModel> loadHistory = [];

  set setUser(UserModel usr) {
    user = usr;
    notifyListeners();
  }

  void initialize() async {
    try {
      final res = await Get.find<IUserService>().getFullProfile();
      if (res.status) {
        user = UserModel.fromJson(res.data!.toJson());
        // profile = res.data!;
        // loadHistory = profile!.user!.orders!;
        backToLoaded();
      } else {
        ToastAlert.showErrorAlert(res.message);
        Get.offAllNamed(Routes.login);
      }
    } catch (error) {
      ToastAlert.showErrorAlert('Error: $error');
      // Get.offAllNamed(Routes.login);
      rethrow;
    }
  }

  UserProfileProvider() {
    initialize();
  }

  void refresh() async {
    backToLoading();
    initialize();
  }

  void deactivateAccount() async {
    try {
      ToastAlert.showLoadingAlert("");
      final res = await Get.find<IUserService>().deactivateAccount();
      ToastAlert.closeAlert();
      if (res.status) {
        ToastAlert.showAlert("Account deactivated successfully");
        Get.offAllNamed(Routes.home);
        backToLoaded();
      } else {
        ToastAlert.showErrorAlert(res.message);
      }
    } catch (error) {
      ToastAlert.closeAlert();
      ToastAlert.showErrorAlert('Error: $error');
      rethrow;
    }
  }

}