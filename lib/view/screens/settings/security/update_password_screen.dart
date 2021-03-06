import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:load_connect/view/components/custom_button.dart';
import 'package:load_connect/view/components/custom_textfield.dart';
import 'package:load_connect/view/utils/helper.dart';

class UpdatePasswordScreen extends HookWidget {
  UpdatePasswordScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isBusy = useState(false);
    final hidden1 = useState(true);
    final hidden2 = useState(true);
    final hidden3 = useState(true);
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
                    hideText: hidden1.value,
                    label: "Current Password",
                    validator: (val) {
                      if (val.isNull || val!.isEmpty) {
                        return "Field is required";
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        hidden1.value = !hidden1.value;
                      },
                      icon: _getIcon(hidden1.value),
                    ),
                  ),
                  SizeMargin.size(height: 20.0.h),
                  CustomTextFormField(
                    hideText: hidden2.value,
                    label: "New Password",
                    validator: (val) {
                      if (val.isNull || val!.isEmpty) {
                        return "Field is required";
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        hidden2.value = !hidden2.value;
                      },
                      icon: _getIcon(hidden2.value),
                    ),
                  ),
                  SizeMargin.size(height: 20.0.h),
                  CustomTextFormField(
                    hideText: hidden3.value,
                    label: "Re-enter New Password",
                    validator: (val) {
                      if (val.isNull || val!.isEmpty) {
                        return "Field is required";
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        hidden3.value = !hidden3.value;
                      },
                      icon: _getIcon(hidden3.value),
                    ),
                  ),
                  SizeMargin.size(height: 24.h),
                  CustomRaisedButton(
                    text: "Save Changes",
                    isBusy: isBusy.value,
                    onPressed: () {
                      isBusy.value = true;
                      Future.delayed(const Duration(seconds: 3), () {
                        isBusy.value = false;
                        snackBar(context, "Update failed, try again");
                      });
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
