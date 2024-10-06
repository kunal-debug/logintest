import 'package:flutter/material.dart';

import '../../../Theme/app_colors.dart';
import '../../../Theme/app_textstyle.dart';
import '../loader/app_loader.dart';

class CustomButton {
  static Widget filledButton({
    required String title,
    required VoidCallback onTap,
    bool? isLoading,
    Color? buttonColor,
    TextStyle? textStyle,
    double? height,
    double? width,
    Widget? child,
    double? borderRadius,
  }) =>
      GestureDetector(
        onTap: isLoading == true ? null : onTap,
        child: Container(
          height: height ?? 50,
          width: width,
          // If width is specified then no padding, else 20
          padding: EdgeInsets.symmetric(horizontal: width == null ? 20 : 0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: buttonColor ?? AppColors().redColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
          ),
          child: isLoading == true
              ? Center(child: AppLoader.threeBounce())
              : child ??
                  Text(
                    title,
                    style: textStyle ??
                        AppTextStyle.titleMedium.copyWith(color: Colors.white),
                  ),
        ),
      );
}
