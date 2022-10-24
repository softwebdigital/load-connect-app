import 'dart:math';
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
  dynamic _type;
  dynamic _name;
  dynamic _email;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    consoleLog(Get.parameters);
    final params = Get.parameters;
    print("Params: $params");
    if (params.containsKey("user_id")) {
      _userID = params['user_id'];
      consoleLog(_userID);
    }
    if (params.containsKey("type")) {
      _type = params['type'];
      consoleLog(_type);
    }
    if (params.containsKey("email")) {
      _email = params['email'];
      consoleLog(_type);
    }
    if (params.containsKey("name")) {
      _name = params['name'];
      consoleLog(_type);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => VerifyAccountProvider(_email, _type),
      builder: (context, child) {
        print("From here ::: ");
        final verifyProvider = Provider.of<VerifyAccountProvider>(context, listen: false);
        return Scaffold(
            appBar: AppBar(
              title: Text(verifyProvider.type == "register" ? "Confirm Email" : "Verify"),
            ),
            body: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  SizedBox(height: 111.h),
                  Text("Hi $_name 👋🏼", style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: "CircularStd"
                  ),),
                  SizeMargin.size(height: 25.h),
                  Text(
                    "We have sent an OTP to your email ($_email) to confirm your registration",
                    style: TextStyle(
                      fontSize: 16.0.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizeMargin.size(height: 25.h),
                  CustomTextField(
                    label: 'OTP',
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    maxLength: 6,
                    controller: otpController,
                    onChanged: (p0) {
                      verifyProvider.setOtp = p0;
                    },
                  ),
                  // SizeMargin.size(height: 8.h),
                  SizeMargin.size(height: 25.h),

                  CustomRaisedButton(
                    text: "Continue",
                    isBusy: false,
                    onPressed: () => verifyProvider.verifyAccount(context),
                  ),
                  SizeMargin.size(height: 32.h),
                  Consumer<VerifyAccountProvider>(
                    builder: (context, value, child) {
                      return Text(
                        "${(value.seconds/60).floor()}:${(value.seconds % 60).toInt()}",
                        style: const TextStyle(
                          color: AppColor.lightgrey,
                        ),
                      );
                    },
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
                  ),
                ],
              ),
            ),
          persistentFooterButtons: [
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Not my email? ",
                  children: [
                    TextSpan(
                      text: " Change Email",
                      style: const TextStyle(
                        color: AppColor.darkGreen,
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
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
            SizedBox(height: 41.h)
          ],
          resizeToAvoidBottomInset: false,
        );
      },
    );
  }

}
