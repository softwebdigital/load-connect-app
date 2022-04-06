import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/shared/routes.dart';
import '../../../core/repository/forgot_password_controller.dart';
import 'package:load_connect/view/components/custom_button.dart';
import 'package:load_connect/view/components/custom_textfield.dart';
import 'package:load_connect/view/utils/helper.dart';

class ResetPasswordScreen extends GetView<ForgotPasswordController> {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        title: const Text("Reset Password"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Obx(() {
          return Column(
            children: [
              const Text(
                "Enter a new password",
                style: TextStyle(
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizeMargin.size(height: 24.h),
              CustomTextField(
                label: 'Password',
                hideText: controller.hideText,
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.hideText = !controller.hideText;
                  },
                  icon: Icon(
                    controller.hideText
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColor.black100,
                  ),
                ),
              ),
              SizeMargin.size(height: 24.h),
              CustomTextField(
                label: 'Re-enter Password',
                hideText: controller.hideText,
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.hideText = !controller.hideText;
                  },
                  icon: Icon(
                    controller.hideText
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColor.black100,
                  ),
                ),
              ),
              SizeMargin.size(height: 24.h),
              CustomRaisedButton(
                text: "Continue",
                isBusy: controller.isBusy,
                onPressed: () {
                  // Future.delayed(const Duration(seconds: 3), () {});
                },
              ),
              SizeMargin.size(height: 32.h),
              RichText(
                text: TextSpan(
                  text: "Remember your password?",
                  children: [
                    TextSpan(
                      text: " Login",
                      style: const TextStyle(
                        color: AppColor.darkGreen,
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.offAllNamed(Routes.login);
                        },
                    ),
                  ],
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColor.black100,
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
