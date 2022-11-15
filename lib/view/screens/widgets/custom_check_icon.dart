import 'package:flutter/material.dart';

import '../../../shared/colors.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    Key? key,
    this.width = 20.0,
    this.height = 20.0,
    this.iconSize = 16.0,
    this.color,
    this.successColor,
    this.isChecked = true,
  }) : super(key: key);
  final double width;
  final double height;
  final double iconSize;
  final Color? color;
  final Color? successColor;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    final Color? theColor;
    if (color != null) {
      theColor = color;
    } else {
      theColor =
          isChecked ? successColor ?? AppColor.primaryColor : AppColor.error;
    }
    return Container(
      height: height,
      width: width,
      decoration: ShapeDecoration(
        color: theColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Icon(
        isChecked ? Icons.check : Icons.close,
        size: iconSize,
        color: AppColor.white100,
      ),
    );
  }
}
