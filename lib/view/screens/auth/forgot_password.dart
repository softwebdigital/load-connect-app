import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/repository/forgot_password_controller.dart';
import '../../../shared/colors.dart';
import '../../../shared/routes.dart';
import '../../components/custom_button.dart';
import '../../components/custom_textfield.dart';
import '../../utils/helper.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        // leadingWidth: 36.0,
        // leading: Padding(
        //   padding: const EdgeInsets.only(
        //     left: 12.0,
        //   ),
        //   child: IconButton(
        //     onPressed: () {
        //       Get.back();
        //     },
        //     icon: const Icon(Icons.arrow_back_ios),
        //   ),
        // ),
        title: Obx(() {
          if (controller.isForgotPassword.value) {
            return const Text("Forgot Password");
          }
          return const Text("Enter OTP");
        }),
        actions: [
          IconButton(
            onPressed: () {
              Get.offNamed(Routes.login);
            },
            icon: const Icon(
              Icons.close,
            ),
          )
        ],
      ),
      body: Obx(() {
        return SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: controller.isForgotPassword.value
              ? const _EnterPhoneOrEmail()
              : const _EnterOtp(),
        );
      }),
    );
  }
}

class _EnterPhoneOrEmail extends StatelessWidget {
  const _EnterPhoneOrEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ForgotPasswordController>();
    return Column(
      children: [
        Text(
          "Enter email or phone number to begin password recovery",
          style: TextStyle(
            fontSize: 14.0.sp,
            color: Colors.black.withOpacity(0.5),
          ),
          textAlign: TextAlign.center,
        ),
        SizeMargin.size(height: 24.h),
        const CustomTextField(
          label: 'Email / Phone Number',
        ),
        SizeMargin.size(height: 24.h),
        Obx(() {
          return CustomRaisedButton(
            text: "Continue",
            isBusy: controller.isBusy,
            onPressed: () {
              controller.runForgotPassword();
            },
          );
        }),
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
                  fontFamily: 'CircularStd',
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    debugPrint("object");
                    Get.offNamed(Routes.login);
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
    );
  }
}

class _EnterOtp extends StatelessWidget {
  const _EnterOtp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ForgotPasswordController>();
    return Column(
      children: [
        Text(
          "A 6-digit OTP has been sent to your phone number",
          style: TextStyle(
              fontSize: 14.0.sp, color: Colors.black.withOpacity(0.5)),
          textAlign: TextAlign.center,
        ),
        SizeMargin.size(height: 24.h),
        const CustomTextField(
          label: 'OTP',
        ),
        // SizeMargin.size(height: 8.h),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () {
              controller.returnToEmailPhone();
            },
            child: const Text("Edit email / phone number"),
          ),
        ),
        SizeMargin.size(height: 24.h),
        Obx(() {
          return CustomRaisedButton(
            text: "Continue",
            isBusy: controller.isBusy,
            onPressed: () async {
              final value = await controller.validateOtp();
              if (value) {
                Get.toNamed(Routes.resetPassword);
              }
            },
          );
        }),
        SizeMargin.size(height: 32.h),
        const Text(
          "01:30",
          style: TextStyle(
            color: AppColor.lightgrey,
          ),
        ),
        SizeMargin.size(height: 6.h),
        RichText(
          text: TextSpan(
            text: "Didn't receive code? ",
            children: [
              TextSpan(
                text: " Resend OTP",
                style: const TextStyle(
                  color: AppColor.darkGreen,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'CircularStd',
                ),
                recognizer: TapGestureRecognizer()..onTap = () {},
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
    );
  }
}
