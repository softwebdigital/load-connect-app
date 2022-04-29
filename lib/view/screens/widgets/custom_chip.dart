import 'package:flutter/material.dart';
import '../../../shared/colors.dart';

import 'custom_check_icon.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({Key? key, required this.title, this.isActive = false})
      : super(key: key);
  final bool isActive;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: isActive ? const Color(0XFFF3F0E7) : Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(
          color: isActive
              ? AppColor.primaryColor
              : AppColor.lightgrey.withOpacity(0.5),
          // width: 2.0,
        ),
      ),
      avatar: isActive
          ? const CustomCheckIcon(width: 16.0, height: 16.0, iconSize: 12.0)
          : null,
      label: Text(title),
    );
  }
}
