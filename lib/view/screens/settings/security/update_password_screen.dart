import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:load_connect/view/components/custom_button.dart';
import 'package:load_connect/view/components/custom_textfield.dart';
import 'package:load_connect/view/providers/user/change_password_provider.dart';
import 'package:load_connect/view/utils/helper.dart';
import 'package:provider/provider.dart';

class UpdatePasswordScreen extends StatelessWidget {
  UpdatePasswordScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final changePasswordProvider = Provider.of<ChangePasswordProvider>(context);
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
        title: const Text("Change Password"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 24.0.h,
          horizontal: 16.0,
        ),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    // hideText: "Current password",
                    label: "Current Password",
                    validator: (val) {
                      if (val.isNull || val!.isEmpty) {
                        return "Field is required";
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () => changePasswordProvider.toggleOldPasswordVisibility(),
                      icon: _getIcon(changePasswordProvider.oldPasswordIsVisible),
                    ),
                    onSaved: (value) => changePasswordProvider.setOldPassword = value!,
                  ),
                  SizeMargin.size(height: 20.0.h),
                  CustomTextFormField(
                    // hideText: hidden2.value,
                    label: "New Password",
                    validator: (val) {
                      if (val.isNull || val!.isEmpty) {
                        return "Field is required";
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () => changePasswordProvider.togglePasswordVisibility(),
                      icon: _getIcon(changePasswordProvider.passwordIsVisible),
                    ),
                    onSaved: (value) => changePasswordProvider.setPassword = value!,
                  ),
                  SizeMargin.size(height: 20.0.h),
                  CustomTextFormField(
                    // hideText: hidden3.value,
                    label: "Re-enter New Password",
                    validator: (val) {
                      if (val.isNull || val!.isEmpty) {
                        return "Field is required";
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () => changePasswordProvider.toggleConfirmPasswordVisibility(),
                      icon: _getIcon(changePasswordProvider.confirmPasswordIsVisible),
                    ),
                    onSaved: (value) => changePasswordProvider.setConfirmPassword = value!,
                  ),
                  SizeMargin.size(height: 24.h),
                  CustomRaisedButton(
                    text: "Save Changes",
                    isBusy: false,
                    onPressed: () {
                      changePasswordProvider.changePassword(context);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getIcon(bool hidden) {
    return hidden
        ? const Icon(Icons.visibility)
        : const Icon(Icons.visibility_off);
  }
}
