import 'package:flutter/material.dart';

import '../Theme/app_textstyle.dart';
import '../main_common.dart';

void showSimpleSnackbar(String title, {bool? clearPrevious}) {
  if (clearPrevious == true) {
    scaffoldKey.currentState!.clearSnackBars();
  }
  scaffoldKey.currentState?.showSnackBar(SnackBar(
      content: Text(title,
          style: AppTextStyle.titleMedium.copyWith(color: Colors.white))));
}

void redirect2page(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

void replacePage(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => widget,
    ),
  );
}

void back2Previous(BuildContext context) {
  Navigator.pop(context);
}

void finishAffinity(final BuildContext context, Widget widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => widget,
    ),
    (Route<dynamic> route) => false,
  );
}
