import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:load_connect_driver/view/providers/user/blocked_user_provider.dart';
import 'package:load_connect_driver/view/providers/user/driver_truck_provider.dart';
import 'package:load_connect_driver/view/providers/user/notification_settings_provider.dart';
import 'package:load_connect_driver/view/providers/user/user_profile_provider.dart';
import 'package:provider/provider.dart';

import './shared/colors.dart';
import './shared/styles.dart';
import 'config/locator.dart';
import 'config/route_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await GetStorage.init();
  // final user = GetStorage().read<Map>('user_data');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserProfileProvider()),
      // ChangeNotifierProvider(create: (context) => VehicleTypeProvider()),
      ChangeNotifierProvider(create: (context) => DriverTruckProvider()),
      ChangeNotifierProvider(create: (context) => NotificationSettingsProvider()),
      ChangeNotifierProvider(create: (context) => BlockedUserProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () {
          return GetMaterialApp(
            title: 'Load Connect Driver',
            theme: ThemeData(
              fontFamily: 'CircularStd',
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: elevatedButtonStyle,
              ),
              scaffoldBackgroundColor: Colors.white,
              textButtonTheme: TextButtonThemeData(
                style: textButtonStyle,
              ),
              appBarTheme: appBarTheme,
              primarySwatch: AppColor.primaryColor,
            ),
            // builder: ,
            builder: (context, widget) {
              ScreenUtil.setContext(context);
              return MediaQuery(
                //Setting font does not change with system font size
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: botToastBuilder(context, widget!),
              );
            },
            initialRoute: RoutePages.init(),
            getPages: RoutePages.routes,
          );
        });
  }
}
