import 'package:flutter/material.dart';

import '../../shared/colors.dart';

class CustomRaisedButton extends StatelessWidget {
  const CustomRaisedButton({
    Key? key,
    this.child,
    this.text,
    this.onPressed,
    this.isBusy,
    this.isDisabled = false,
    this.backgroundColor,
  })  : assert(text != null || child != null),
        // assert(text == null && child != null),
        super(key: key);
  final Widget? child;
  final bool? isBusy;
  final bool isDisabled;
  final String? text;
  final GestureTapCallback? onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _busy || isDisabled ? null : onPressed,
      child: _getChild(),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        primary: backgroundColor,
      ),
    );
  }

  Widget _getChild() {
    if (isBusy != null && isBusy!) {
      return const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(AppColor.white100),
      );
    }
    return child ?? Text(text!);
  }

  bool get _busy {
    if (isBusy == null) return false;
    return isBusy!;
  }
}
