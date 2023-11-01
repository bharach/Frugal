import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../../constants/color/app_colors.dart';

class OtpForm extends StatelessWidget {
  final String? p1, p2, p3, p4;

  const OtpForm({super.key, this.p1, this.p2, this.p3, this.p4});

  @override
  Widget build(BuildContext context) {
    return OTPTextField(
      length: 4,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      otpFieldStyle: OtpFieldStyle(
        // enabledBorderColor: AppColor.otpEnableBorderColor,
        backgroundColor: AppColor.otpDefaultBGColor,
        borderColor: AppColor.otpDefaultBorderColor,
        errorBorderColor: AppColor.otpErrorBorderColor,
       focusBorderColor: AppColor.otpFocusBorderColor
        // focusBorderColor: AppColor.otpEnableBorderColor
      ),

      width: MediaQuery.of(context).size.width,
      keyboardType: TextInputType.number,
      outlineBorderRadius: 10,
      spaceBetween: 05,
      fieldWidth: MediaQuery.of(context).size.width / 5,
      style: GoogleFonts.urbanist(
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
          color: AppColor.mainTitleTextColor),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.box,
      // onCompleted: (pin) {
      //   // print("Completed: " + pin);
      // },
    );
  }
}
