import 'package:flutter/material.dart';
import 'package:paitentapp/constants/color/app_colors.dart';

import '../../constants/screen_size/app_screen_size.dart';
import '../app_text/app_text.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final String? activeText;
  final IconData? activeIcon;
  final VoidCallback onTap;

  final Color? backgroundColor;
  final Color? borderColor;
  final Color? activeColor;
  final EdgeInsets margin;

  const SubmitButton(
      {Key? key,
      required this.text,
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
        width: ScreenSize.width(context),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColor.primaryColor,
          borderRadius: BorderRadius.circular(05),
          border: Border.all(
            color: borderColor ?? AppColor.primaryBtnBorderColor,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x80000000),
              blurRadius: 4.0,
              offset: Offset(0.0, 2.0), //? Offset(2, 2),
            ),
          ],
          // gradient: btnGradient
        ),
        child: Padding(
          // padding: EdgeInsets.symmetric(vertical: 12),
          padding: const EdgeInsets.symmetric(vertical: 17),
          child: Center(
            child: SubmitButtonText(
              tittle: text,
              tittleColor: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
