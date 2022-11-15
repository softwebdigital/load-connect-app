import 'package:get/get.dart';
import 'package:load_connect_driver/view/providers/user/create_truck_provider.dart';
import 'package:load_connect_driver/view/screens/intro_screen.dart';
import 'package:load_connect_driver/view/screens/truck/create_truck/create_truck_screen.dart';
import 'package:provider/provider.dart';

import '../core/repository/forgot_password_controller.dart';
import '../shared/routes.dart';
import '../view/all_screens.dart';
import '../view/providers/user/change_password_provider.dart';

class RoutePages {
  static String init() {
    // return Routes.home;
    return Routes.intro;
  }

  static final List<GetPage> routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: Routes.intro,
      page: () => const IntroScreen(),
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
      page: () => ChangeNotifierProvider(
        child: const CreateTruckScreen(),
        create: (context) => CreateTruckProvider(),
      ),
      // binding: BindingsBuilder(
      //   () => Get.lazyPut(
      //     () => CreateTruckController(),
      //   ),
      // ),
    ),
    // GetPage(
    //   name: Routes.addTruckSpecs,
    //   page: () => const AddTruckSpecsScreen(),
    // ),
    // GetPage(
    //   name: Routes.addTruckImages,
    //   page: () => const AddTruckImagesScreen(),
    // ),
    // GetPage(
    //   name: Routes.addTruckDocuments,
    //   page: () => const AddTruckDocumentsScreen(),
    // ),
    GetPage(
      name: Routes.truckGoLive,
      page: () => const TruckGoLiveScreen(),
    ),
    // GetPage(
    //   name: Routes.truckDetails,
    //
    // ),
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
      name: Routes.notifications,
      page: () => const NotificationScreen(),
    ),
    GetPage(
      name: Routes.notificationSettings,
      page: () => const NotificationSettingScreen(),
    ),
  ];
}
