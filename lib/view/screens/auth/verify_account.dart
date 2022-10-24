
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/shared/routes.dart';
// import 'package:flutter_hooks/screen)ur.dart';
import 'package:load_connect/view/components/custom_button.dart';
import 'package:load_connect/view/components/custom_textfield.dart';
import 'package:load_connect/view/providers/auth/login_provider.dart';
import 'package:load_connect/view/utils/helper.dart';
import 'package:provider/provider.dart';

class VerifyAccountScreen extends StatelessWidget {
  const VerifyAccountScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

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
              CustomTextFormField(
                validator: (v) {
                  if (v.isNull || v!.isEmpty) return "This field is required";
                  return null;
                },
                onSaved: (v) {
                  loginProvider.setEmail = v!;
                },
                label: 'Email / Phone Number',
              ),
              SizeMargin.size(height: 24.h),
              CustomTextFormField(
                label: 'Password',
                hideText: !loginProvider.passwordIsVisible,
                validator: (v) {
                  if (v.isNull || v!.isEmpty) return "This field is required";
                  return null;
                },
                onSaved: (v) {
                  loginProvider.setPassword = v!;
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    loginProvider.togglePasswordVisibility();
                  },
                  icon: Icon(
                    !loginProvider.passwordIsVisible ? Icons.visibility : Icons.visibility_off,
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
                isBusy: false,
                onPressed: () async {
                  loginProvider.login(context);
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
                        fontWeight: FontWeight.w700,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
