import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:load_connect/core/repository/auth_repo.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/shared/routes.dart';
// import 'package:flutter_hooks/screen)ur.dart';
import 'package:load_connect/view/components/custom_button.dart';
import 'package:load_connect/view/components/custom_textfield.dart';
import 'package:load_connect/view/utils/helper.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  bool _isLoading = false;
  final _authRepo = Get.find<AuthRepo>();
  final _otpController = TextEditingController();
  dynamic _userID;
  String get _otpText => _otpController.value.text;

  @override
  void initState() {
    super.initState();
    consoleLog(Get.parameters);
    final params = Get.parameters;
    if (params.containsKey("user_id")) {
      _userID = params['user_id'];
      consoleLog(_userID);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Complete Registration"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              const Text(
                "Enter the OTP sent to your email",
                style: TextStyle(
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizeMargin.size(height: 24.h),
              CustomTextField(
                controller: _otpController,
                label: 'OTP',
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                maxLength: 6,
              ),
              // SizeMargin.size(height: 8.h),
              SizeMargin.size(height: 12.h),
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    text: "Already verified? ",
                    children: [
                      TextSpan(
                        text: " Login",
                        style: const TextStyle(
                          color: AppColor.darkGreen,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _authRepo.clearLastPage();
                            Get.offAndToNamed(Routes.login);
                          },
                      ),
                    ],
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColor.black100,
                      fontFamily: '',
                    ),
                  ),
                ),
              ),
              SizeMargin.size(height: 24.h),
              CustomRaisedButton(
                text: "Continue",
                isBusy: _isLoading,
                onPressed: _processVerification,
              ),
              SizeMargin.size(height: 32.h),
              const Text(
                "01:30",
                style: TextStyle(
                  color: AppColor.lightgrey,
                ),
              ),
              SizeMargin.size(height: 8.h),
              RichText(
                text: TextSpan(
                  text: "Didn't receive code? ",
                  children: [
                    TextSpan(
                      text: " Resend OTP",
                      style: const TextStyle(
                        color: AppColor.darkGreen,
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColor.black100,
                    fontFamily: '',
                  ),
                ),
              )
            ],
          ),
        ));
  }

  void _processVerification() async {
    consoleLog(_otpText);
    if (_otpText.length < 5) {
      snackBar(context, "Enter a valid otp code");
      return;
    }
    try {
      setBusy(true);
      final res = await _authRepo.verifyToken(_userID, _otpText, true);
      setBusy(false);

      if (res.status) {
        Get.offAllNamed(Routes.home);
      } else {
        if (res.message != null) {
          snackBar(context, res.message!);
        } else {
          final messages = res.messages?.join('\n') ??
              "We could not process your request, please try again";
          Get.closeAllSnackbars();
          Get.snackbar(
            "An error occurred",
            messages,
            backgroundColor: AppColor.error.withRed(220),
            colorText: AppColor.white200,
            duration: const Duration(seconds: 5),
          );
        }
      }
    } catch (e) {
      setBusy(false);
      snackBar(context, "An unknown error occured, try again");
    }
  }

  void setBusy(bool value) {
    if (mounted) {
      setState(() {
        _isLoading = value;
      });
    }
  }
}
