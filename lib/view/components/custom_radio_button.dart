import 'package:flutter/material.dart';

import '../../shared/colors.dart';
import '../utils/helper.dart';

class CustomRadioButton<T> extends StatelessWidget {
  const CustomRadioButton({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.subtitle,
    this.leading,
  }) : super(key: key);
  final String title;
  final String? subtitle;
  final Widget? leading;
  final T value;
  final T groupValue;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    final isCurrent = value == groupValue;
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),

        // padding: const EdgeInsets.fromLTRB(16.0, 2.0, 0.0, 2.0),
        decoration: ShapeDecoration(
          color: isCurrent ? const Color(0XFFF3F0E7) : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: isCurrent ? AppColor.primaryColor : AppColor.black400,
              width: 2.0,
            ),
          ),
        ),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (leading != null) ...[
              leading!,
              SizeMargin.size(width: 8.0),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w400,
                    ),
                  ),
                  if (subtitle != null) ...[
                    SizeMargin.size(height: 4.0),
                    Text(
                      subtitle!,
                      style: const TextStyle(
                        fontSize: 12.0, color: AppColor.grey,
                        // fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w400,
                      ),
                    ),
                  ]
                ],
              ),
            ),
            SizeMargin.size(width: 4.0),
            _radioButton(isCurrent)
          ],
        ),
      ),
    );
  }

  Widget _radioButton(bool isActive) {
    return Container(
      height: 20.0,
      width: 20.0,
      decoration: ShapeDecoration(
        color: isActive ? AppColor.primaryColor : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            color: isActive ? AppColor.primaryColor : AppColor.black400,
            // color: isActive ? AppColor.primaryColor : AppColor.lightgrey,
            width: 2.0,
          ),
        ),
      ),
      child: isActive
          ? const Icon(
              Icons.check,
              size: 16.0,
              color: AppColor.white100,
            )
          : null,
    );
  }
}
