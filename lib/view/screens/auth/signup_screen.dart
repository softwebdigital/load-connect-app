import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class SignupScreen extends StatefulHookWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _authRepo = Get.find<AuthRepo>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, dynamic> data = {
    'fname': "",
    'lname': "",
    "email": "",
    'phone': "",
    "password": "",
  };

  @override
  Widget build(BuildContext context) {
    final isBusy = useState(false);
    final hideText = useState(true);

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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                label: 'First Name',
                validator: (v) {
                  if (v.isNull || v!.isEmpty) return "This field is required";
                  return null;
                },
                onSaved: (val) {
                  data['fname'] = val;
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
                  data['lname'] = val;
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
                  data['phone'] = val;
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
                  data['email'] = val;
                },
              ),
              SizeMargin.size(height: 24.h),
              CustomTextFormField(
                label: 'Password',
                hideText: hideText.value,
                suffixIcon: IconButton(
                  onPressed: () {
                    hideText.value = !hideText.value;
                  },
                  icon: Icon(
                    hideText.value ? Icons.visibility : Icons.visibility_off,
                    color: AppColor.black100,
                  ),
                ),
                validator: (v) {
                  if (v.isNull || v!.isEmpty) return "This field is required";
                  return null;
                },
                onSaved: (val) {
                  data['password'] = val;
                },
              ),
              SizeMargin.size(height: 24.h),
              CustomTextFormField(
                label: 'Re-enter Password',
                hideText: hideText.value,
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
              SizeMargin.size(height: 12.h),
              _termsSection(),
              SizeMargin.size(height: 24.h),
              CustomRaisedButton(
                text: "Sign up",
                isBusy: isBusy.value,
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) return;
                  _formKey.currentState!.save();
                  try {
                    isBusy.value = true;
                    final result = await _authRepo.signup(data);
                    isBusy.value = false;

                    if (result.status) {
                      Get.offAllNamed(
                        "${Routes.registrationOtp}?user_id=${result.message}",
                      );
                    } else {
                      if (result.message != null) {
                        snackBar(context, result.message!);
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
                    snackBar(context, "An unknown error occured, try again");
                  }
                },
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
