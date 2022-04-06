import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

final ButtonStyle elevatedButtonStyle = ButtonStyle(
  foregroundColor: MaterialStateProperty.resolveWith(
    (_) => AppColor.white100,
  ),
  backgroundColor: MaterialStateProperty.resolveWith<Color>(
    (Set<MaterialState> states) {
      // if (states.contains(MaterialState.pressed))
      // return Theme.of(context).colorScheme.primary.withOpacity(0.5);
      if (states.contains(MaterialState.disabled)) {
        return AppColor.darkGreen.withOpacity(0.6);
      }
      return AppColor.darkGreen;
    },
  ),
  minimumSize: MaterialStateProperty.resolveWith(
    (_) => Size(double.maxFinite, 60.0.h),
  ),
  // minimumSize: const Size(double.maxFinite, 60.0),
);
final ButtonStyle textButtonStyle = TextButton.styleFrom(
  primary: AppColor.darkGreen,
);

AppBarTheme appBarTheme = AppBarTheme(
  foregroundColor: Colors.white,
  toolbarHeight: kToolbarHeight.h,
  elevation: 0,
  titleTextStyle: TextStyle(
    color: AppColor.deepGreen,
    fontSize: 24.0.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'CircularStd',
  ),
  // systemOverlayStyle: SystemUiOverlayStyle.light,
  centerTitle: false,
  color: AppColor.primaryColor,
  // shadowColor: Colors.transparent,
  iconTheme: IconThemeData(color: const Color(0XFF19352A), size: 24.0.h),
);
