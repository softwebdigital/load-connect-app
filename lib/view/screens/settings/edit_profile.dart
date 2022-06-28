import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:load_connect/view/components/custom_button.dart';
import 'package:load_connect/view/components/custom_textfield.dart';
import 'package:load_connect/view/providers/user/update_profile_provider.dart';
import 'package:load_connect/view/providers/user/user_profile_provider.dart';
import 'package:load_connect/view/utils/helper.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final userProvider = Provider.of<UserProfileProvider>(context);
    final user = userProvider.user;
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
        title: const Text("Edit Profile"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => UpdateProfileProvider(user),
        builder: (context, child) {
          final updateProfileProvider = Provider.of<UpdateProfileProvider>(context);

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              vertical: 24.0.h,
              horizontal: 16.0,
            ),
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(
                    // child: Text("BR"),
                    backgroundImage: user.profilePhotoUrl!.isEmpty
                        ? const AssetImage("assets/images/icon.png")
                        : CachedNetworkImageProvider(user.profilePhotoUrl ?? "") as ImageProvider,
                    // backgroundImage: AssetImage("assets/images/icon.png"),
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
                        onSaved: (val) => updateProfileProvider.firstName = val!,
                        label: "First Name",
                        initialValue: user.firstName,
                        validator: (val) {
                          if (val.isNull || val!.isEmpty) {
                            return "Field is required";
                          }
                          return null;
                        },
                      ),
                      SizeMargin.size(height: 20.0.h),
                      CustomTextFormField(
                        onSaved: (val) => updateProfileProvider.lastName = val!,
                        label: "Last Name",
                        initialValue: user.lastName,
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
                        initialValue: user.phoneNumber,
                        readOnly: true,
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
                        label: "Email",
                        initialValue: user.email,
                        readOnly: true,
                        validator: (val) {
                          if (val.isNull || val!.isEmpty) {
                            return "Field is required";
                          }
                          if (!GetUtils.isEmail(val)) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizeMargin.size(height: 20.0.h),
                      CustomTextFormField(
                        label: "State of Residence",
                        initialValue: "",
                        onSaved: (val) => updateProfileProvider.state = val!,
                        validator: (val) {
                          if (val.isNull || val!.isEmpty) {
                            return "Field is required";
                          }
                          return null;
                        },
                      ),
                      SizeMargin.size(height: 20.0.h),
                      CustomTextFormField(
                        label: "Address",
                        initialValue: "",
                        onSaved: (val) => updateProfileProvider.address = val!,
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
                        isBusy: false,
                        onPressed: () => updateProfileProvider.updateProfile(context),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
