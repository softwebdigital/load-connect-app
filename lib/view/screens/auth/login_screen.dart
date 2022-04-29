import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../shared/colors.dart';
import '../../../shared/routes.dart';
import '../../components/custom_button.dart';
import '../../components/custom_textfield.dart';
import '../../utils/helper.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isBusy = useState(false);
    final hideText = useState(true);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              SizeMargin.size(height: 80.h),
              Image.asset(
                "assets/images/logo.png",
                width: 240.0.w,
              ),
              SizeMargin.size(height: 113.h),
              const CustomTextField(
                label: 'Email / Phone Number',
              ),
              SizeMargin.size(height: 24.h),
              CustomTextField(
                label: 'Password',
                hideText: hideText.value,
                suffixIcon: IconButton(
                  onPressed: () {
                    hideText.value = !hideText.value;
                  },
                  icon: Icon(
                    hideText.value ? Icons.visibility : Icons.visibility_off,
                    color: AppColor.black100,
                  ),
                ),
              ),
              SizeMargin.size(height: 8.h),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Get.offAndToNamed(Routes.forgotPassword);
                  },
                  child: const Text("Forgot password?"),
                ),
              ),
              SizeMargin.size(height: 24.h),
              CustomRaisedButton(
                text: "Login",
                isBusy: isBusy.value,
                onPressed: () {
                  isBusy.value = true;
                  Future.delayed(const Duration(seconds: 3), () {
                    // isBusy.value = false;
                    Get.offAllNamed(Routes.home);
                  });
                },
              ),
              SizeMargin.size(height: 32.h),
              RichText(
                text: TextSpan(
                  text: "Don't have an account?",
                  children: [
                    TextSpan(
                      text: " Sign Up",
                      style: const TextStyle(
                        color: AppColor.darkGreen,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'CircularStd',
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          debugPrint("object");
                          Get.toNamed(Routes.signup);
                        },
                    ),
                  ],
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColor.black100,
                    fontFamily: 'CircularStd',
                  ),
                ),
              ),
              SizeMargin.size(height: 12.h),
              RichText(
                text: TextSpan(
                  text: "Just browsing?",
                  children: [
                    TextSpan(
                      text: " Skip Login",
                      style: const TextStyle(
                        color: AppColor.darkGreen,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'CircularStd',
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          debugPrint("object");
                          Get.offAllNamed(Routes.home);
                        },
                    ),
                  ],
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColor.black100,
                    fontFamily: 'CircularStd',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
