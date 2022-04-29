import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../components/custom_button.dart';
import '../../components/custom_textfield.dart';
import '../../utils/helper.dart';

class EditProfileScreen extends HookWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isBusy = useState(false);
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
        title: const Text("Edit Business Profile"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 24.0.h,
          horizontal: 16.0,
        ),
        child: Column(
          children: [
            const Center(
              child: CircleAvatar(
                // child: Text("BR"),
                backgroundImage: AssetImage("assets/images/icon.png"),
                radius: 48.0,
              ),
            ),
            SizeMargin.size(height: 16.0.h),
            TextButton(
              onPressed: () {},
              child: const Text("Upload picture"),
            ),
            const Divider(),
            SizeMargin.size(height: 24.0.h),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    onSaved: (val) {},
                    label: "First Name",
                    initialValue: "",
                    validator: (val) {
                      if (val.isNull || val!.isEmpty) {
                        return "Field is required";
                      }
                      return null;
                    },
                  ),
                  SizeMargin.size(height: 20.0.h),
                  CustomTextFormField(
                    label: "CAC Number (optional)",
                    initialValue: "AS12345",
                    validator: (val) {
                      if (val.isNull || val!.isEmpty) {
                        return "Field is required";
                      }
                      return null;
                    },
                  ),
                  SizeMargin.size(height: 20.0.h),
                  CustomTextFormField(
                    label: "Phone Number",
                    initialValue: "John doe",
                    validator: (val) {
                      if (val.isNull || val!.isEmpty) {
                        return "Field is required";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  SizeMargin.size(height: 20.0.h),
                  CustomTextFormField(
                    label: "Business Email",
                    initialValue: "John doe",
                    validator: (val) {
                      if (val.isNull || val!.isEmpty) {
                        return "Field is required";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizeMargin.size(height: 20.0.h),
                  CustomTextFormField(
                    label: "Address",
                    initialValue: "John doe",
                    validator: (val) {
                      if (val.isNull || val!.isEmpty) {
                        return "Field is required";
                      }
                      return null;
                    },
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
}
