import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      this.canPop = true,
      this.title,
      this.actions,
      this.bottom,
      this.height = 0.0})
      : super(key: key);
  final bool canPop;
  final Widget? title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leadingWidth: canPop ? 36.0 : null,
      toolbarHeight: kToolbarHeight + height,
      leading: canPop
          ? Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            )
          : null,
      title: title,
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + height);
}
