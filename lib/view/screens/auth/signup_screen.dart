import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../shared/colors.dart';
// import 'package:flutter_hooks/screen)ur.dart';
import '../../components/custom_button.dart';
import '../../components/custom_textfield.dart';
import '../../utils/helper.dart';

class SignupScreen extends HookWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isBusy = useState(false);
    final hideText = useState(true);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 36.0,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
          ),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        title: const Text(
          "Sign Up",
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            const CustomTextField(
              label: 'Business Name',
            ),
            SizeMargin.size(height: 24.h),
            const CustomTextField(
              label: 'CAC Number (optional)',
            ),
            SizeMargin.size(height: 24.h),
            const CustomTextField(
              label: 'Phone Number',
            ),
            SizeMargin.size(height: 24.h),
            const CustomTextField(
              label: 'Business Email',
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
            SizeMargin.size(height: 24.h),
            CustomTextField(
              label: 'Re-enter Password',
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
            SizeMargin.size(height: 12.h),
            RichText(
              text: TextSpan(
                text: "By signing up, you agree to the ",
                children: [
                  TextSpan(
                    text: "Terms of service",
                    style: const TextStyle(
                      color: AppColor.darkGreen,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'CircularStd',
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        debugPrint("object");
                      },
                  ),
                  const TextSpan(
                    text: " and ",
                  ),
                  TextSpan(
                    text: "Privacy Policy",
                    style: const TextStyle(
                      color: AppColor.darkGreen,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'CircularStd',
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        debugPrint("object");
                      },
                  ),
                ],
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColor.black100,
                  height: 1.6,
                  fontFamily: 'CircularStd',
                ),
              ),
              textAlign: TextAlign.center,
            ),
            SizeMargin.size(height: 24.h),
            CustomRaisedButton(
              text: "Sign Up",
              isBusy: isBusy.value,
              onPressed: () {
                isBusy.value = true;
                Future.delayed(const Duration(seconds: 3), () {
                  isBusy.value = false;
                });
              },
            ),
            SizeMargin.size(height: 32.h),
            RichText(
              text: TextSpan(
                text: "Already have an account?",
                children: [
                  TextSpan(
                    text: " Login",
                    style: const TextStyle(
                      color: AppColor.darkGreen,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'CircularStd',
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.back();
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
    );
  }
}
