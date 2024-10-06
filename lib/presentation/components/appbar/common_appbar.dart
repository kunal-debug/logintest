import 'package:flutter/material.dart';
import 'package:logintest/Theme/app_colors.dart';
import 'package:logintest/Theme/app_textstyle.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final IconData? backIcon;
  final VoidCallback? onBackButtonPressed;
  final Color titleColor;

  CustomAppBar({
    required this.title,
    this.showBackButton = true,
    this.backIcon = Icons.arrow_back,
    this.onBackButtonPressed,
    this.titleColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: AppTextStyle.titleExtraLarge.copyWith(color: AppColors().boxColor),
      ),
      backgroundColor: AppColors().redColor,
      leading: showBackButton
          ? IconButton(
              icon: Icon(backIcon, color: AppColors().boxColor),
              onPressed:
                  onBackButtonPressed ?? () => Navigator.of(context).pop(),
            )
          : null, // Show or hide back button based on 'showBackButton' flag
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
