import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/color/app_colors.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hint;
  final TextInputType textInputType;
  final String error;
  final bool clicked;
  const TextFieldInput(
      {super.key,
      required this.textEditingController,
      this.isPass = false,
      required this.hint,
      required this.textInputType,
      required this.error,
      required this.clicked});

  @override
  Widget build(BuildContext context) {
    // final inputBorder =
    //     OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        controller: textEditingController,
        keyboardType: textInputType,
        obscureText: isPass,
        decoration: InputDecoration(
          fillColor: AppColor.detailsTextFiledBgColor,
          filled: true,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(12),
          hintText: hint,
          errorText: clicked == true && textEditingController.text.isEmpty
              ? error
// Display invalid format for Date
              : error == 'Invalid Format(YYYY-MM-DD)'
                  ? error
                  : null,
          hintStyle: GoogleFonts.urbanist(
              fontSize: 13, // 15
              // fontSize: ScreenSize.width(context) < 360
              //     ? ScreenSize.width(context) * 0.03
              //     : ScreenSize.width(context) * 0.05,
              fontWeight: FontWeight.w500, // Medium
              color: AppColor.hintTitleTextColor),
          suffixIcon: const SizedBox(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(05),
            borderSide: const BorderSide(
                color: AppColor.textFiledBorderColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(05),
              borderSide: BorderSide(color: AppColor.primaryColor, width: 1)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(05),
              borderSide: const BorderSide(color: Colors.red, width: 1)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(05),
              borderSide: const BorderSide(color: Colors.red, width: 1)),
        ),
      ),
    );
  }
}
