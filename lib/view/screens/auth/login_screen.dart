import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:load_connect/core/repository/auth_repo.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/shared/routes.dart';
// import 'package:flutter_hooks/screen)ur.dart';
import 'package:load_connect/view/components/custom_button.dart';
import 'package:load_connect/view/components/custom_textfield.dart';
import 'package:load_connect/view/utils/helper.dart';

class LoginScreen extends StatefulHookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  String email = "";
  String password = "";

  @override
  void dispose() {
    super.dispose();
    _otpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isBusy = useState(false);
    final hideText = useState(true);
    final _authRepo = Get.find<AuthRepo>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Form(
            key: _formKey,
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
                    email = v!;
                  },
                  label: 'Email / Phone Number',
                ),
                SizeMargin.size(height: 24.h),
                CustomTextFormField(
                  label: 'Password',
                  hideText: hideText.value,
                  validator: (v) {
                    if (v.isNull || v!.isEmpty) return "This field is required";
                    return null;
                  },
                  onSaved: (v) {
                    password = v!;
                  },
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
                  isBusy: isBusy.value,
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) return;
                    _formKey.currentState!.save();
                    isBusy.value = true;
                    try {
                      final result = await _authRepo.login(email, password);
                      isBusy.value = false;

                      if (result.status) {
                        Get.offAllNamed(Routes.home);
                      } else {
                        if (result.message != null) {
                          if (result.message == "unverified") {
                            Get.offNamed(
                              "${Routes.registrationOtp}?user_id=${result.data['id']}",
                            );
                          } else {
                            snackBar(context, result.message!);
                          }
                        } else {
                          final messages = result.messages?.join('\n') ??
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
                      isBusy.value = false;
                      consoleLog(e);
                      snackBar(context, "An unknown error occured");
                    }
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
      ),
    );
  }
}
