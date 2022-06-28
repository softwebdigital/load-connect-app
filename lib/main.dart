import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:load_connect/config/locator.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/shared/styles.dart';
import 'package:load_connect/view/providers/user/user_profile_provider.dart';
import 'package:provider/provider.dart';

import 'config/route_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await setupServiceLocator();
  runApp(MultiProvider(
    child: const MyApp(),
    providers: [
      ChangeNotifierProvider(create: (context) => UserProfileProvider())
    ]
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
            title: 'Load Connect',
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
            initialRoute: RoutePages.init(isLoggedIn: false),
            getPages: RoutePages.routes,
            navigatorObservers: [BotToastNavigatorObserver()],
          );
        });
  }
}
