import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:load_connect/core/repository/create_load_controller.dart';
import 'package:load_connect/core/repository/forgot_password_controller.dart';
import '../shared/routes.dart';
import '../view/all_screens.dart';

class RoutePages {
  static String init({bool isLoggedIn = false}) {
    final lastPage = GetStorage().read<Map<String, dynamic>?>("last_page");
    if (lastPage != null) {
      return getLastPage(lastPage);
    } else if (isLoggedIn) {
      return Routes.home;
    } else {
      return Routes.login;
    }
  }

  static String getLastPage(Map<String, dynamic> savedPage) {
    switch (savedPage['page']) {
      case Routes.signup:
        return "${Routes.signup}${savedPage['params']}";
      case Routes.registrationOtp:
        return "${Routes.registrationOtp}${savedPage['params']}";
      default:
        return Routes.login;
    }
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
      name: Routes.registrationOtp,
      page: () => const OtpVerificationScreen(),
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
      name: Routes.findPlace,
      page: () => const GooglePlaceFindScreen(),
    ),
    GetPage(
      name: Routes.openMaps,
      page: () => const SelectPlaceOnMap(),
    ),
    GetPage(
      name: Routes.loadDetails,
      page: () => const LoadDetailsScreen(),
    ),
    GetPage(
      name: Routes.selectLoadLocation,
      page: () => const SelectLoadLocationScreen(),
      binding: BindingsBuilder(
        () => Get.lazyPut(
          () => CreateLoadController(),
        ),
      ),
    ),
    GetPage(
      name: Routes.addLoadDetails,
      page: () => const AddLoadDetailsScreen(),
    ),
    GetPage(
      name: Routes.addLoadImages,
      page: () => const AddLoadImagesScreen(),
    ),
    GetPage(
      name: Routes.loadReceiverInfo,
      page: () => const LoadReceiverInfoScreen(),
    ),
    GetPage(
      name: Routes.otherLoadInfo,
      page: () => const OtherLoadInfoScreen(),
    ),
    GetPage(
      name: Routes.kyc,
      page: () => const KycScreen(),
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
      name: Routes.blockedList,
      page: () => const BlockedListScreen(),
    ),
    GetPage(
      name: Routes.notifications,
      page: () => const NotificationScreen(),
    )
  ];
}
