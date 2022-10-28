import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:load_connect/backend/services/core/i_local_storage.dart';
import 'package:load_connect/shared/constants.dart';
import 'package:load_connect/view/providers/auth/login_provider.dart';
import 'package:load_connect/view/providers/auth/register_provider.dart';
import 'package:load_connect/view/providers/user/change_password_provider.dart';
import 'package:load_connect/view/providers/user/create_load_provider.dart';
import 'package:load_connect/view/screens/intro_screen.dart';
import 'package:load_connect/view/screens/load/create_load/create_load_screen.dart';
import 'package:provider/provider.dart';
import '../shared/routes.dart';
import '../view/all_screens.dart';

class RoutePages {
  static Future<String> init() async {

    final lastPage = GetStorage().read<Map<String, dynamic>?>("last_page");
    final isLoggedIn = await Get.find<ILocalStorageService>().getItem(userDataBox, userTokenKey);
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
      name: Routes.intro,
      page: () => const IntroScreen(),
    ),
    GetPage(
      name: Routes.login,
      page: () => ChangeNotifierProvider(
        create: (context) => LoginProvider(),
        child: const LoginScreen(),
      ),
    ),
    GetPage(
      name: Routes.signup,
      page: () => ChangeNotifierProvider(
        create: (context) => RegisterProvider(),
        child: const SignupScreen(),
      ),
    ),
    GetPage(
      name: Routes.registrationOtp,
      page: () => const OtpVerificationScreen(),
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(
      name: Routes.resetPassword,
      page: () => const ResetPasswordScreen(),
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
    // GetPage(
    //   name: Routes.loadDetails,
    //   page: () => LoadDetailsScreen(),
    // ),
    GetPage(
      name: Routes.createLoad,
      page: () => ChangeNotifierProvider(
        create: (context) => CreateLoadProvider(),
        child: const CreateLoadScreen(),
      ),
      children: [
        GetPage(
          name: Routes.selectLoadLocation,
          page: () => const SelectLoadLocationScreen(),
        ),
        GetPage(
          name: Routes.addLoadDetails,
          page: () => AddLoadDetailsScreen(),
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
      ]
    ),

    GetPage(
      name: Routes.kyc,
      page: () => const KycScreen(),
    ),
    GetPage(
      name: Routes.updatePassword,
      page: () => ChangeNotifierProvider(
        child: UpdatePasswordScreen(),
        create: (context) => ChangePasswordProvider()
      ),
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
