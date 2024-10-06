import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppLoader {
  static Widget threeBounce({Color? color}) => SizedBox(
        height: 10,
        child: SpinKitThreeBounce(
          color: color ?? Colors.white,
          size: 30,
          duration: const Duration(milliseconds: 1000),
        ),
      );

  static Widget cupertinoLoader({double? radius}) =>
      CupertinoActivityIndicator(radius: radius ?? 15);
}
