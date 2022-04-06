import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/view/screens/truck/truck_details.dart';
import 'package:load_connect/view/utils/helper.dart';
import 'package:unicons/unicons.dart';

class TruckDetailsCard extends StatelessWidget {
  const TruckDetailsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Get.to(const TruckDetailsScreen());
      },
      child: Card(
        color: AppColor.white200,
        elevation: 0.5,
        margin: const EdgeInsets.only(bottom: 12.0),
        shadowColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Mercedes benz actros",
                        style: TextStyle(
                          // color: AppColor.lightgrey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizeMargin.size(height: 4.0),
                      RichText(
                        text: const TextSpan(
                          text: "Truck",
                          children: [
                            TextSpan(
                              text: " | SSD-283NV",
                              style: TextStyle(
                                color: AppColor.lightgrey,
                              ),
                            ),
                          ],
                          style: TextStyle(
                              color: Color(0XFF333333), fontSize: 12.0),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/icon.png",
                        ),
                        fit: BoxFit.cover,
                        // scale: 0.5,
                      ),
                    ),
                  ),
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(5.0),
                  //   child: Image.asset(
                  //     "assets/images/logo.png",
                  //     width: 40.0,
                  //     height: 40.0,
                  //   ),
                  // ),
                ],
              ),

              SizeMargin.size(height: 16.0.h),
              // first row
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: SizedBox(
                      width: width * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Truck",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: AppColor.lightgrey,
                            ),
                          ),
                          SizeMargin.size(height: 4.0.h),
                          const Text(
                            "Mini Truck",
                            style: TextStyle(
                              color: Color(0XFF333333),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizeMargin.size(width: 24.w),
                  Flexible(
                    child: SizedBox(
                      width: width * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Capacity",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: AppColor.lightgrey,
                            ),
                          ),
                          SizeMargin.size(height: 4.0.h),
                          const Text(
                            "Full Truck Load",
                            style: TextStyle(
                              color: Color(0XFF333333),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizeMargin.size(width: 12.0.w),
                ],
              ),
              SizeMargin.size(height: 16.0.h),
              // second row
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: SizedBox(
                      width: width * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Distance",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: AppColor.lightgrey,
                            ),
                          ),
                          SizeMargin.size(height: 4.0.h),
                          RichText(
                            text: const TextSpan(
                              text: "23",
                              children: [
                                TextSpan(
                                  text: " Km",
                                  style: TextStyle(
                                    color: AppColor.lightgrey,
                                  ),
                                ),
                              ],
                              style: TextStyle(
                                color: Color(0XFF333333),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizeMargin.size(width: 24.w),
                  Flexible(
                    child: SizedBox(
                      width: width * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Weight",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: AppColor.lightgrey,
                            ),
                          ),
                          SizeMargin.size(height: 4.0.h),
                          RichText(
                            text: const TextSpan(
                              text: "523.3",
                              children: [
                                TextSpan(
                                  text: " Kg",
                                  style: TextStyle(
                                    color: AppColor.lightgrey,
                                  ),
                                ),
                              ],
                              style: TextStyle(
                                color: Color(0XFF333333),
                              ),
                            ),
                            // textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizeMargin.size(width: 0.0.w),
                ],
              ),
              SizeMargin.size(height: 20.0.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("John Doe"),
                      SizeMargin.size(height: 4.0.h),
                      _getStarRatings()
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: AppColor.white300,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Icon(
                            UniconsLine.envelope,
                            color: AppColor.darkGreen,
                            size: 20.0,
                          ),
                        ),
                      ),
                      SizeMargin.size(width: 16.0),
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: AppColor.white300,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Icon(
                            UniconsLine.phone,
                            color: AppColor.darkGreen,
                            size: 20.0,
                          ),
                        ),
                      ),
                      SizeMargin.size(width: 16.0),
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: AppColor.white300,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Icon(
                            UniconsLine.plus,
                            color: AppColor.darkGreen,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getStarRatings() {
    return Row(
      children: [
        for (var _ in [1, 2, 3, 4])
          Icon(
            Icons.star_rounded,
            color: const Color(0XFFFFC000),
            size: 20.0.sp,
          ),
        Icon(
          Icons.star_half_rounded,
          color: const Color(0XFFFFC000),
          size: 20.0.sp,
        ),
      ],
    );
  }
}

// class _ActionButton extends StatelessWidget {
//   const _ActionButton({Key? key, required this.icon, required this.ontap})
//       : super(key: key);
//   final GestureTapCallback ontap;
//   final IconData icon;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: ontap,
//       child: Container(
//         padding: const EdgeInsets.all(6.0),
//         decoration: BoxDecoration(
//           color: AppColor.white300,
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         child: Icon(
//           icon,
//           color: AppColor.darkGreen,
//           size: 20.0,
//         ),
//       ),
//     );
//   }
// }
