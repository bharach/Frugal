import 'package:flutter/material.dart';

import '../../constants/color/app_colors.dart';

class AppBackButton extends StatelessWidget {

  final Color? textColor;
  final String? activeText;
  final IconData? activeIcon;
  final VoidCallback onTap;

  final Color? backgroundColor;
  final Color? borderColor;
  final Color? activeColor;
  final EdgeInsets margin;

  const AppBackButton(
      {Key? key,
      this.activeText,
      this.activeIcon,
      this.textColor,
      required this.onTap,
      this.borderColor,
      this.activeColor,
      this.margin = const EdgeInsets.symmetric(vertical: 7.5),
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 47,
        height: 47,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColor.backButtonColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: borderColor ?? AppColor.backButtonBorderColor,
            width: 2
          ),
          // gradient: btnGradient
        ),
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Image.asset(
            "assets/icons/back_arrow.png",
            
          ),
        ),
      ),
    );
  }
}
