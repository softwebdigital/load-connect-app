import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/view/components/custom_appbar.dart';
import 'package:load_connect/view/components/custom_button.dart';
import 'package:load_connect/view/hooks/load_hooks.dart';
import 'package:load_connect/view/providers/user/create_load_provider.dart';
import 'package:load_connect/view/utils/helper.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class AddLoadImagesScreen extends StatelessWidget {
  const AddLoadImagesScreen({Key? key}) : super(key: key);
  // final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final createLoadProvider = Provider.of<CreateLoadProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(
        height: 12.0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Upload images of load",
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              "3 out of 5",
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: LinearPercentIndicator(
            width: width,
            animation: true,
            padding: EdgeInsets.zero,
            lineHeight: 10.0,
            animationDuration: 1000,
            percent: 0.6,
            // center: Text("80.0%"),
            // linearStrokeCap: LinearStrokeCap.roundAll,
            backgroundColor: const Color(0XFFF2F2F2),
            progressColor: AppColor.yellow,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (createLoadProvider.images.isNotEmpty)
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0
                  // childAspectRatio: 16 / 9,
                ),
                children: [
                  for (var image in createLoadProvider.images)
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.topRight,
                      height: 165,
                      width: (width / 2) - 20,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        image: DecorationImage(image: FileImage(image), fit: BoxFit.cover),
                      ),
                      child: GestureDetector(
                        onTap: () => createLoadProvider.removeImage(image),
                        child: const CircleAvatar(
                          backgroundColor: Color(0XFFFFF9E6),
                          child: Icon(
                            Icons.close,
                            color: AppColor.black100,
                          ),
                        ),
                      ),
                    ),
                ],
              ),

            // Con
            SizeMargin.size(
              height: createLoadProvider.images.isEmpty ? 50.0 : 24.0,
            ),
            TextButton.icon(
              onPressed: () => createLoadProvider.pickLoadImages(),
              icon: const Icon(
                Icons.upload_rounded,
              ),
              label: const Text("Upload Picture"),
              style: TextButton.styleFrom(
                backgroundColor: const Color(0XFFE8E8E8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                minimumSize: Size(
                  247.w,
                  60.0,
                ),
              ),
            ),
            SizeMargin.size(height: 24.0),
            const Text(
              "Each picture must not exceed 5 MB.",
              style: TextStyle(
                color: AppColor.lightgrey,
                fontSize: 12.0,
              ),
            ),
            SizeMargin.size(height: 8.0),
            const Text(
              "Supported formats are .jpg and .png",
              style: TextStyle(
                color: AppColor.lightgrey,
                fontSize: 12.0,
              ),
            ),
            SizeMargin.size(height: 24.0),
            CustomRaisedButton(
              text: "Continue",
              // isDisabled: controller.pickedImages.isEmpty,
              onPressed: () {
                // Get.toNamed(Routes.loadReceiverInfo);
                createLoadProvider.next();
              },
            ),
            SizeMargin.size(height: 24.0),
            TextButton(
              onPressed: () {
                useCloseCreateLoad(context);
              },
              child: const Text("Cancel & Delete Load"),
            )
          ],
        ),
      ),
    );
  }
}
