import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:load_connect_driver/view/providers/user/create_truck_provider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../../shared/colors.dart';
import '../../../components/custom_appbar.dart';
import '../../../components/custom_button.dart';
import '../../../hooks/truck_hooks.dart';
import '../../../utils/helper.dart';

class AddTruckDocumentsScreen extends StatelessWidget {
  const AddTruckDocumentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final provider = Provider.of<CreateTruckProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(
        height: 12.0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Truck Documents",
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              "4 out of 4",
              style: TextStyle(
                fontSize: 12.0,
                color: AppColor.white300,
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
            percent: 1,
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
            if (provider.truckDoc.isNotEmpty)
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
                  for (var image in provider.truckDoc)
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.topRight,
                      height: 165,
                      width: (width / 2) - 20,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        image: DecorationImage(
                            image: FileImage(image), fit: BoxFit.cover),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          provider.removeDoc(provider.truckDoc.indexOf(image));
                        },
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
              height: provider.truckDoc.isEmpty ? 50.0 : 24.0,
            ),
            TextButton.icon(
              onPressed: () {
                provider.selectTruckDocs(context);
              },
              icon: const Icon(
                Icons.upload_rounded,
              ),
              label: const Text("Upload Document Images"),
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
              text: "Save & Add Truck",
              // isDisabled: controller.pickedImages.isEmpty,
              onPressed: () {
                provider.createTruck(context);
              },
            ),
            SizeMargin.size(height: 24.0),
            TextButton(
              onPressed: () {
                useCloseCreateTruck(context);
              },
              child: const Text("Cancel & Delete Truck"),
            )
          ],
        ),
      ),
    );
  }
}
