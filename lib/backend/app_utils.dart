import 'package:flutter/material.dart';
import 'package:test_flutter_level/constants.dart';

void showSnackBar({
  required BuildContext context,
  required Widget content,
  bool isError = false,
  int duration = 3,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.fixed,
    backgroundColor: isError ? ERROR_COLOR : COLOR_BLUE,
    content: content,
    duration: Duration(seconds: duration),
  ));
}
