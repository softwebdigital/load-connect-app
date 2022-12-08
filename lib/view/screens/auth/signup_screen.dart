import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:load_connect_driver/view/all_screens.dart';
import 'package:load_connect_driver/view/providers/auth/register_provider.dart';
import 'package:provider/provider.dart';

import '../../../shared/colors.dart';
// import 'package:flutter_hooks/screen)ur.dart';
import '../../components/custom_button.dart';
import '../../components/custom_textfield.dart';
import '../../utils/helper.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<RegisterProvider>(context);
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
            CustomTextFormField(
              label: 'First Name',
              onSaved: (name) {
                provider.setFirstName = name!;
              },
            ),
            SizeMargin.size(height: 24.h),

            CustomTextFormField(
              label: 'Last Name',
              onSaved: (name) {
                provider.setLastName = name!;
              },
            ),
            SizeMargin.size(height: 24.h),

            CustomTextFormField(
              label: 'Business Name',
              onSaved: (name) {
                provider.setBusinessName = name!;
              },
            ),
            SizeMargin.size(height: 24.h),
            CustomTextFormField(
              label: 'CAC Number (optional)',
              onSaved: (name) {
                provider.cacNumber = name!;
              },
            ),
            SizeMargin.size(height: 24.h),
            CustomTextFormField(
              label: 'Phone Number',
              onSaved: (name) {
                provider.setPhoneNumber = name!;
              },
              keyboardType: TextInputType.number,
            ),
            SizeMargin.size(height: 24.h),
            CustomTextFormField(
              label: 'Business Email',
              onSaved: (name) {
                provider.setEmail = name!;
              },
            ),
            SizeMargin.size(height: 24.h),
            CustomTextFormField(
              label: 'Password',
              hideText: !provider.passwordIsVisible,
              onSaved: (name) {
                provider.setPassword = name!;
              },
              suffixIcon: IconButton(
                onPressed: () {
                  provider.togglePasswordVisibility();
                },
                icon: Icon(
                  !provider.passwordIsVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColor.black100,
                ),
              ),
            ),
            SizeMargin.size(height: 24.h),
            CustomTextFormField(
              label: 'Re-enter Password',
              hideText: !provider.confirmPasswordIsVisible,
              suffixIcon: IconButton(
                onPressed: () {
                  provider.toggleConfirmPasswordVisibility();
                },
                icon: Icon(
                  !provider.confirmPasswordIsVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColor.black100,
                ),
              ),
              onSaved: (name) {
                provider.setConfirmPassword = name!;
              },
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
              isBusy: false,
              onPressed: () => provider.register(context, 'driver'),
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
                        Get.offAll(const LoginScreen());
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
