import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/shared/routes.dart';
// import 'package:flutter_hooks/screen)ur.dart';
import 'package:load_connect/view/components/custom_button.dart';
import 'package:load_connect/view/components/custom_textfield.dart';
import 'package:load_connect/view/interaction/toast_alert.dart';
import 'package:load_connect/view/providers/auth/verify_account_provider.dart';
import 'package:load_connect/view/utils/helper.dart';
import 'package:provider/provider.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  dynamic _userID;

  @override
  void initState() {
    super.initState();
    consoleLog(Get.parameters);
    final params = Get.parameters;
    print("Params: $params");
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
    ToastAlert.closeAlert();
    return ChangeNotifierProvider(
      create: (context) => VerifyAccountProvider(_userID),
      builder: (context, child) {
        final verifyProvider = Provider.of<VerifyAccountProvider>(context);
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
                    label: 'OTP',
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    maxLength: 6,
                    onChanged: (String value) => verifyProvider.setOtp = value,
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
                                // _authRepo.clearLastPage();
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
                    isBusy: false,
                    onPressed: () => verifyProvider.verifyAccount(context),
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
                          recognizer: TapGestureRecognizer()..onTap = () => verifyProvider.resendOtp(),
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
      },
    );
  }

}
