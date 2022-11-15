import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:load_connect_driver/backend/models/entities/driver_truck_model.dart';
import 'package:load_connect_driver/shared/routes.dart';
import 'package:load_connect_driver/view/all_screens.dart';

import '../../shared/colors.dart';
import '../utils/helper.dart';

class TruckDetailsCard extends StatelessWidget {
  const TruckDetailsCard({
    Key? key,
    required this.truck
  }) : super(key: key);

  final DriverTruckModel truck;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(TruckDetailsScreen(
          truck: truck,
        ));
      },
      child: Card(
        color: AppColor.white200,
        elevation: 0.5,
        margin: EdgeInsets.only(bottom: 30.0.h),
        shadowColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300.h,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/images/truck.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${truck.name}",
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: AppColor.blackgrey,
                          ),
                        ),
                        SizeMargin.size(height: 6.0),
                        RichText(
                          text: TextSpan(
                            text: "Pick-up Truck",
                            children: [
                              TextSpan(
                                text: " | ",
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: AppColor.black100.withOpacity(.6),
                                ),
                              ),
                              TextSpan(
                                text: "${truck.plateNumber}",
                                style: TextStyle(
                                  color: AppColor.black100.withOpacity(.6),
                                  fontFamily: 'CircularStd',
                                ),
                              ),
                            ],
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: AppColor.blackgrey,
                              fontFamily: 'CircularStd',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  _ActionButton(
                    icon: Icons.border_color_outlined,
                    ontap: () {
                      Get.toNamed(Routes.truckDetails);
                    },
                    size: 24.0,
                  ),
                  SizeMargin.size(width: 24.0.w),
                  _ActionButton(
                    icon: Icons.sensors_rounded,
                    ontap: () {
                      Get.toNamed(Routes.truckGoLive);
                    },
                    size: 24.0,
                    // isDisabled: !isApproved,
                  )
                ],
              ),
            ),
            if (true) ...[
              SizeMargin.size(height: 16.0.h),
              Container(
                padding: const EdgeInsets.all(5.0),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColor.yellow,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: const Text(
                  "Waiting to be approved",
                  style: TextStyle(
                    color: AppColor.lightgrey,
                  ),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    Key? key,
    required this.icon,
    required this.ontap,
    this.size = 20.0,
    this.isDisabled = false,
  }) : super(key: key);
  final GestureTapCallback ontap;
  final IconData icon;
  final double size;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8.0),
      onTap: isDisabled ? () {} : ontap,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isDisabled
              ? AppColor.white400.withOpacity(0.4)
              : AppColor.white400,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Icon(
          icon,
          color: isDisabled
              ? AppColor.darkGreen.withOpacity(0.4)
              : AppColor.darkGreen,
          size: size,
        ),
      ),
    );
  }
}
