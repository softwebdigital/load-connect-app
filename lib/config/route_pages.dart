import 'package:get/get.dart';
import 'package:load_connect_driver/core/repository/create_truck_controller.dart';
import '../core/repository/forgot_password_controller.dart';
import '../shared/routes.dart';
import '../view/all_screens.dart';

class RoutePages {
  static String init() {
    // return Routes.home;
    return Routes.login;
  }

  static final List<GetPage> routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: Routes.signup,
      page: () => const SignupScreen(),
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
      binding: BindingsBuilder(
        () => Get.lazyPut(
          () => ForgotPasswordController(),
        ),
      ),
    ),
    GetPage(
      name: Routes.resetPassword,
      page: () => const ResetPasswordScreen(),
      binding: BindingsBuilder(
        () => Get.lazyPut(
          () => ForgotPasswordController(),
        ),
      ),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: Routes.loadDetails,
      page: () => const LoadDetailsScreen(),
    ),
    GetPage(
      name: Routes.addTruckInfo,
      page: () => const AddTruckInfoScreen(),
      binding: BindingsBuilder(
        () => Get.lazyPut(
          () => CreateTruckController(),
        ),
      ),
    ),
    GetPage(
      name: Routes.addTruckSpecs,
      page: () => const AddTruckSpecsScreen(),
    ),
    GetPage(
      name: Routes.addTruckImages,
      page: () => const AddTruckImagesScreen(),
    ),
    GetPage(
      name: Routes.addTruckDocuments,
      page: () => const AddTruckDocumentsScreen(),
    ),
    GetPage(
      name: Routes.truckGoLive,
      page: () => const TruckGoLiveScreen(),
    ),
    GetPage(
      name: Routes.truckDetails,
      page: () => const TruckDetailsScreen(),
    ),
    GetPage(
      name: Routes.savedOrRecentLoads,
      page: () => const SavedOrRecentLoadsScreen(),
    ),
    GetPage(
      name: Routes.kyc,
      page: () => const KycScreen(),
    ),
    GetPage(
      name: Routes.blockedList,
      page: () => const BlockedListScreen(),
    ),
    GetPage(
      name: Routes.updatePassword,
      page: () => UpdatePasswordScreen(),
    ),
    GetPage(
      name: Routes.deactivateAccount,
      page: () => DeactivateAccountScreen(),
    ),
    GetPage(
      name: Routes.notifications,
      page: () => const NotificationScreen(),
    ),
    GetPage(
      name: Routes.notificationSettings,
      page: () => const NotificationSettingScreen(),
    ),
  ];
}
