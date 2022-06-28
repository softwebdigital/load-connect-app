import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/shared/routes.dart';
import 'package:load_connect/view/components/custom_button.dart';
import 'package:load_connect/view/components/custom_textfield.dart';
import 'package:load_connect/view/providers/auth/reset_password_provider.dart';
import 'package:load_connect/view/utils/helper.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatelessWidget {
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
      body: ChangeNotifierProvider(
        create: (context) => ResetPasswordProvider(token: "token", userId: "userId"),
        builder: (context, child) {

          final resetPasswordProvider = Provider.of<ResetPasswordProvider>(context);

          return SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
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
                  hideText: !resetPasswordProvider.passwordIsVisible,
                  suffixIcon: IconButton(
                    onPressed: () => resetPasswordProvider.togglePasswordVisibility(),
                    icon: Icon(
                      !resetPasswordProvider.passwordIsVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColor.black100,
                    ),
                  ),
                ),
                SizeMargin.size(height: 24.h),
                CustomTextField(
                  label: 'Re-enter Password',
                  hideText: !resetPasswordProvider.confirmPasswordIsVisible,
                  suffixIcon: IconButton(
                    onPressed: () => resetPasswordProvider.toggleConfirmPasswordVisibility(),
                    icon: Icon(
                      !resetPasswordProvider.confirmPasswordIsVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColor.black100,
                    ),
                  ),
                ),
                SizeMargin.size(height: 24.h),
                CustomRaisedButton(
                  text: "Continue",
                  isBusy: false,
                  onPressed: () => resetPasswordProvider.resetPassword(context),
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
            ),
          );
        },
      ),
    );
  }
}
