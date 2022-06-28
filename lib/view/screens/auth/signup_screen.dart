import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/shared/routes.dart';
import 'package:load_connect/view/components/custom_button.dart';
import 'package:load_connect/view/components/custom_textfield.dart';
import 'package:load_connect/view/interaction/toast_alert.dart';
import 'package:load_connect/view/providers/auth/register_provider.dart';
import 'package:load_connect/view/utils/helper.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);
    // ToastAlert.closeAlert();
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
        title: const Text("Sign up"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            CustomTextFormField(
              label: 'First Name',
              validator: (v) {
                if (v.isNull || v!.isEmpty) return "This field is required";
                return null;
              },
              onSaved: (val) {
                registerProvider.setFirstName = val!;
              },
            ),
            SizeMargin.size(height: 24.h),
            CustomTextFormField(
              label: 'Last Name',
              validator: (v) {
                if (v.isNull || v!.isEmpty) return "This field is required";
                return null;
              },
              onSaved: (val) {
                registerProvider.setLastName = val!;
              },
            ),
            SizeMargin.size(height: 24.h),
            CustomTextFormField(
              label: 'Phone Number',
              validator: (v) {
                if (v.isNull || v!.isEmpty) return "This field is required";
                return null;
              },
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onSaved: (val) {
                registerProvider.setPhoneNumber = val!;
              },
            ),
            SizeMargin.size(height: 24.h),
            CustomTextFormField(
              label: 'Email',
              validator: (v) {
                if (v.isNull || v!.isEmpty) return "This field is required";
                if (!GetUtils.isEmail(v)) return "Enter a valid email";
                return null;
              },
              onSaved: (val) {
                registerProvider.setEmail = val!;
              },
            ),
            SizeMargin.size(height: 24.h),
            CustomTextFormField(
              label: 'Password',
              hideText: !registerProvider.passwordIsVisible,
              suffixIcon: IconButton(
                onPressed: () => registerProvider.togglePasswordVisibility(),
                icon: Icon(
                  !registerProvider.passwordIsVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColor.black100,
                ),
              ),
              validator: (v) {
                if (v.isNull || v!.isEmpty) return "This field is required";
                return null;
              },
              onSaved: (val) {
                registerProvider.setPassword = val!;
              },
            ),
            SizeMargin.size(height: 24.h),
            CustomTextFormField(
              label: 'Re-enter Password',
              hideText: !registerProvider.confirmPasswordIsVisible,
              suffixIcon: IconButton(
                onPressed: () => registerProvider.toggleConfirmPasswordVisibility(),
                icon: Icon(
                  !registerProvider.confirmPasswordIsVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColor.black100,
                ),
              ),
            ),
            SizeMargin.size(height: 12.h),
            _termsSection(),
            SizeMargin.size(height: 24.h),
            CustomRaisedButton(
              text: "Sign up",
              isBusy: false,
              onPressed: () => registerProvider.register(context, 'user'),
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
                      fontWeight: FontWeight.w700,
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _termsSection() {
    return RichText(
      text: TextSpan(
        text: "By signing up, you agree to the ",
        children: [
          TextSpan(
            text: "Terms of service",
            style: const TextStyle(
              color: AppColor.darkGreen,
              fontWeight: FontWeight.w600,
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
        ),
      ),
      textAlign: TextAlign.center,
    );
  }
}
