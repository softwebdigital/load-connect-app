import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../shared/colors.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_textfield.dart';
import '../../../utils/helper.dart';

class DeactivateAccountScreen extends HookWidget {
  DeactivateAccountScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isBusy = useState(false);
    final hidden = useState(true);
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
        title: const Text("Deactivate Account"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 24.0.h,
          horizontal: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Are you sure you want to deactivate your account?",
              style: TextStyle(
                fontSize: 16.0.sp,
                color: AppColor.black300,
              ),
            ),
            SizeMargin.size(height: 24.0.h),
            const Text(
              "This would:",
              style: TextStyle(
                color: AppColor.primaryColor,
              ),
            ),
            SizeMargin.size(height: 10.0.h),
            Text(
              "Delete all your data with Load Connect",
              style: TextStyle(
                fontSize: 14.0.sp,
                color: AppColor.black200,
              ),
            ),
            SizeMargin.size(height: 4.0.h),
            Text(
              "Delete all your load history",
              style: TextStyle(
                fontSize: 14.0.sp,
                color: AppColor.black200,
              ),
            ),
            SizeMargin.size(height: 24.0.h),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    hideText: hidden.value,
                    label: "Password",
                    validator: (val) {
                      if (val.isNull || val!.isEmpty) {
                        return "Field is required";
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        hidden.value = !hidden.value;
                      },
                      icon: _getIcon(hidden.value),
                    ),
                  ),
                  SizeMargin.size(height: 24.h),
                  CustomRaisedButton(
                    text: "Deactivate Account",
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
