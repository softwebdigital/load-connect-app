import 'dart:io';

import 'package:flutter/material.dart'
    show ScaffoldMessenger, SizedBox, Text, BuildContext, SnackBar, debugPrint;
import 'package:intl/intl.dart';

class SizeMargin {
  static size({double? height, double? width}) => SizedBox(
        height: height,
        width: width,
      );
}

extension NullChecker on String? {
  /*/// Converts the first letter of a string to [null].
  ///
  /// Example:
  /// ```dart
  /// var string = 'example';
  /// string.capitalize();     // Example
  /// ``` */
  bool get isNull => this == null;
}

String get currency {
  var format =
      NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
  return format.currencySymbol;
}

void snackBar(BuildContext context, String message,
    [Duration timer = const Duration(milliseconds: 4000)]) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
      ),
      duration: timer,
    ),
  );
}

void consoleLog(dynamic e) {
  debugPrint("$e");
}
