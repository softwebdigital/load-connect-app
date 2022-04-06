import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/shared/routes.dart';
import 'package:load_connect/view/utils/app_dialog.dart';
import 'package:load_connect/view/utils/helper.dart';
import 'package:unicons/unicons.dart';

class LoadDetailsCard extends StatelessWidget {
  const LoadDetailsCard({Key? key, this.isDetails = true}) : super(key: key);
  final bool isDetails;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isDetails) {
          Get.toNamed(Routes.loadDetails);
        } else {
          AppDialog.mainDialog(
            title: "Send Load Pickup Invitation?",
            content: "Invite John Doe Business to pick up this load?",
            buttonText: "Yes, Accept",
          );
        }
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
          padding: const EdgeInsets.only(top: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "From",
                      style: TextStyle(
                        color: AppColor.lightgrey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizeMargin.size(height: 2.0),
                    const Text(
                      "Commercial Ave Sabo yaba, Lagos",
                      style: TextStyle(
                        // color: AppColor.lightgrey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizeMargin.size(height: 6.0),
                    const Text(
                      "To",
                      style: TextStyle(
                        color: AppColor.lightgrey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizeMargin.size(height: 2.0),
                    const Text(
                      "Admirity Way, Lekki phase 1, Lagos",
                      style: TextStyle(
                        // color: AppColor.lightgrey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizeMargin.size(height: 16.0.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _InfoTile(
                          title: "Weight",
                          content: RichText(
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
                          ),
                        ),
                        SizeMargin.size(width: 24.w),
                        const _InfoTile(
                          title: "Capacity",
                          content: Text(
                            "Full Truck Load",
                            style: TextStyle(
                              color: Color(0XFF333333),
                            ),
                          ),
                        ),
                        SizeMargin.size(width: 24.w),
                        const _InfoTile(
                          title: "Pick Date",
                          content: Text(
                            "January 25",
                            style: TextStyle(
                              color: Color(0XFF333333),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizeMargin.size(height: 12.0.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const _InfoTile(
                          title: "Category",
                          content: Text(
                            "Mini Truck",
                            style: TextStyle(
                              color: Color(0XFF333333),
                            ),
                          ),
                        ),
                        SizeMargin.size(width: 24.w),
                        _InfoTile(
                          title: "Distance",
                          content: RichText(
                            text: const TextSpan(
                              text: "53",
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
                        ),
                        SizeMargin.size(width: 24.w),
                        _InfoTile(
                          title: "Estimate",
                          content: DefaultTextStyle(
                            style: const TextStyle(),
                            child: Text(
                              "${currency}200,000",
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 12.0.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizeMargin.size(height: 16.0.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("John Doe"),
                            SizeMargin.size(height: 4.0.h),
                            Text(
                              "Just now",
                              style: TextStyle(
                                  color: AppColor.black100.withOpacity(.8),
                                  fontSize: 10.0),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            _ActionButton(
                              icon: UniconsLine.envelope,
                              ontap: () {},
                            ),
                            SizeMargin.size(width: 16.0),
                            _ActionButton(
                              icon: UniconsLine.phone,
                              ontap: () {},
                            ),
                            if (!isDetails) ...[
                              SizeMargin.size(width: 16.0),
                              _ActionButton(
                                icon: Icons.local_offer_outlined,
                                ontap: () {},
                              )
                            ]
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColor.yellow,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: const Text(
                  "Waiting for an offer...",
                  style: TextStyle(
                    color: AppColor.lightgrey,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    Key? key,
    required this.title,
    required this.content,
    this.width,
  }) : super(key: key);
  final double? width;
  final String title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        width: width ?? 200.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 12.0,
                color: AppColor.lightgrey,
              ),
            ),
            SizeMargin.size(height: 4.0.h),
            content,
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({Key? key, required this.icon, required this.ontap})
      : super(key: key);
  final GestureTapCallback ontap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8.0),
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          color: AppColor.white300,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Icon(
          icon,
          color: AppColor.darkGreen,
          size: 20.0,
        ),
      ),
    );
  }
}
