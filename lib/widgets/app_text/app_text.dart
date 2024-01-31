import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patientapp/constants/color/app_colors.dart';

class AppTiitleText extends StatelessWidget {
  //?  e.g :- GUISS DOCTOR
  const AppTiitleText({
    super.key,
    this.fontweight,
    required this.tittle,
    this.alignnment,
    this.maxTextlines,
    this.tittleColor,
    this.textSize,
  });

  final String tittle;
  final Color? tittleColor;
  final int? maxTextlines;
  final TextAlign? alignnment;
  final FontWeight? fontweight;

  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      maxLines: maxTextlines,
      textAlign: alignnment ?? TextAlign.start,
      style: GoogleFonts.montserrat(
          fontSize: textSize ?? 16 ,
          // fontSize: ScreenSize.width(context) < 360
          //     ? ScreenSize.width(context) * 0.03
          //     : ScreenSize.width(context) * 0.05,
          fontWeight: fontweight ?? FontWeight.bold,
          color: tittleColor ?? AppColor.bodytitleTextColorBlack),
    );
  }
}

class MainTittleText extends StatelessWidget {
  //? e.g  :- OTP Verification
  const MainTittleText({
    super.key,
    required this.tittle,
    this.alignnment,
    this.maxTextlines,
    this.tittleColor,
    this.textWeight,
    this.textSize,
  });

  final String tittle;
  final Color? tittleColor;
  final int? maxTextlines;
  final TextAlign? alignnment;
  final double? textSize;
  final FontWeight? textWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      maxLines: maxTextlines,
      textAlign: alignnment ?? TextAlign.start,
      style: GoogleFonts.urbanist(
          fontSize: textSize ?? 27,
          // fontSize: ScreenSize.width(context) < 360
          //     ? ScreenSize.width(context) * 0.03
          //     : ScreenSize.width(context) * 0.05,
          fontWeight: textWeight ?? FontWeight.bold, // 700
          color: tittleColor ?? AppColor.mainTitleTextColor),
    );
  }
}

class BodyTittleText extends StatelessWidget {
  //?  e.g :- Welcome, John
  const BodyTittleText({
    super.key,
    required this.tittle,
    this.alignnment,
    this.maxTextlines,
    this.tittleColor,
    this.textSize,
    this.fontweight,
    this.lineHeightight,
  });

  final String tittle;
  final Color? tittleColor;
  final int? maxTextlines;
  final TextAlign? alignnment;
  final double? textSize;
  final FontWeight? fontweight;
  final double? lineHeightight;

  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      maxLines: maxTextlines,
      textAlign: alignnment ?? TextAlign.start,
      style: GoogleFonts.urbanist(
          fontSize: textSize ?? 18,
          height: lineHeightight ?? 0.0,
          // fontSize: ScreenSize.width(context) < 360
          //     ? ScreenSize.width(context) * 0.03
          //     : ScreenSize.width(context) * 0.05,
          fontWeight: FontWeight.w600, // semibold
          color: tittleColor ?? AppColor.bodytitleTextColorBlack),
    );
  }
}

// ignore: must_be_immutable
class BodySubTittleText extends StatelessWidget {
  //? e.g :- Enter the One Time Password
  BodySubTittleText(
      {super.key,
      required this.tittle,
      this.maxTextlines,
      this.tittleColor,
      this.textSize,
      this.lineheight,
      this.alignnment,
      this.textdecoration,
      this.lineHeight,
      this.fontweight});

  final String tittle;
  Color? tittleColor;
  double? lineheight;
  double? textSize;
  int? maxTextlines;
  FontWeight? fontweight;
  TextAlign? alignnment;
  TextDecoration? textdecoration;
  double? lineHeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      maxLines: maxTextlines ?? 1,
      textAlign: alignnment ?? TextAlign.start,
      style: GoogleFonts.urbanist(
          fontSize: textSize ?? 14, //16
          height: lineheight ?? 0.0,
          decoration: textdecoration ?? TextDecoration.none,
          // fontSize: ScreenSize.width(context) < 360
          //     ? ScreenSize.width(context) * 0.03
          //     : ScreenSize.width(context) * 0.05,
          fontWeight: fontweight ?? FontWeight.w500, // Medium
          color: tittleColor ?? AppColor.bodysubTitleTextColor),
    );
  }
}

class BodyText extends StatelessWidget {
  const BodyText(
      {super.key,
      required this.tittle,
      this.alignnment,
      this.maxTextlines,
      this.tittleColor,
      this.textsize});

  final String tittle;
  final Color? tittleColor;
  final double? textsize;
  final int? maxTextlines;
  final TextAlign? alignnment;

  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      textAlign: alignnment ?? TextAlign.start,
      maxLines: maxTextlines,
      style: GoogleFonts.mulish(
          fontSize: textsize ?? 16 ,
          fontWeight: FontWeight.w400,
          color: tittleColor ?? Colors.white60),
    );
  }
}

class DescriptionText extends StatelessWidget {
  const DescriptionText(
      {super.key,
      required this.tittle,
      this.alignnment,
      this.maxTextlines,
      this.tittleColor,
      this.textsize});

  final String tittle;
  final Color? tittleColor;
  final double? textsize;
  final int? maxTextlines;
  final TextAlign? alignnment;

  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      textAlign: alignnment ?? TextAlign.start,
      maxLines: maxTextlines,
      style: GoogleFonts.mulish(
          fontSize: textsize ?? 14 ,
          fontWeight: FontWeight.w400,
          color: tittleColor ?? Colors.white60),
    );
  }
}

// ?  Time Slot Text Decoration

class TImeSlotText extends StatelessWidget {
  const TImeSlotText(
      {super.key,
      required this.tittle,
      this.alignnment,
      this.maxTextlines,
      this.tittleColor,
      this.textsize});

  final String tittle;
  final Color? tittleColor;
  final double? textsize;
  final int? maxTextlines;
  final TextAlign? alignnment;

  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      textAlign: alignnment ?? TextAlign.start,
      maxLines: maxTextlines,
      style: GoogleFonts.roboto(
          fontSize: textsize ?? 18 , // 20
          fontWeight: FontWeight.bold,
          color: tittleColor ?? AppColor.tiemeSlotTxtColor),
    );
  }
}

//! TextField Text Decoration

class TxtFldTittleText extends StatelessWidget {
  //?  e.g :- Enter Mobile Number
  const TxtFldTittleText({
    super.key,
    required this.tittle,
    this.alignnment,
    this.maxTextlines,
    this.tittleColor,
    this.textSize,
  });

  final String tittle;
  final Color? tittleColor;
  final int? maxTextlines;
  final TextAlign? alignnment;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      maxLines: maxTextlines,
      textAlign: alignnment ?? TextAlign.start,
      style: GoogleFonts.urbanist(
          fontSize: textSize ?? 20,
          // fontSize: ScreenSize.width(context) < 360
          //     ? ScreenSize.width(context) * 0.03
          //     : ScreenSize.width(context) * 0.05,
          fontWeight: FontWeight.bold, // w700
          color: tittleColor ?? AppColor.txtFldTitleTextColor),
    );
  }
}

class HintTittleText extends StatelessWidget {
  //?  e.g :- enter your text (text Field)
  const HintTittleText({
    super.key,
    required this.tittle,
    this.alignnment,
    this.maxTextlines,
    this.tittleColor,
    this.textSize,
  });

  final String tittle;
  final Color? tittleColor;
  final int? maxTextlines;
  final TextAlign? alignnment;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      maxLines: maxTextlines,
      textAlign: alignnment ?? TextAlign.start,
      style: GoogleFonts.urbanist(
          fontSize: textSize ?? 15 ,
          // fontSize: ScreenSize.width(context) < 360
          //     ? ScreenSize.width(context) * 0.03
          //     : ScreenSize.width(context) * 0.05,
          fontWeight: FontWeight.w500, // Medium
          color: tittleColor ?? AppColor.hintTitleTextColor),
    );
  }
}

//! Link Text

class LinkText extends StatelessWidget {
  //?  e.g :- I have trouble signing in
  const LinkText({
    super.key,
    required this.tittle,
    this.alignnment,
    this.maxTextlines,
    this.tittleColor,
    this.textSize,
  });

  final String tittle;
  final Color? tittleColor;
  final int? maxTextlines;
  final TextAlign? alignnment;

  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      maxLines: maxTextlines,
      textAlign: alignnment ?? TextAlign.start,
      style: GoogleFonts.inter(
          fontSize: textSize ?? 12,
          decoration: TextDecoration.underline,
          // fontSize: ScreenSize.width(context) < 360
          //     ? ScreenSize.width(context) * 0.03
          //     : ScreenSize.width(context) * 0.05,
          fontWeight: FontWeight.w400, // regular
          color: tittleColor ?? AppColor.linkTextColor),
    );
  }
}

//! Button Text

class SubmitButtonText extends StatelessWidget {
  const SubmitButtonText(
      {super.key,
      required this.tittle,
      this.alignnment,
      this.maxTextlines,
      this.tittleColor,
      this.textsize});

  final String tittle;
  final Color? tittleColor;
  final double? textsize;
  final int? maxTextlines;
  final TextAlign? alignnment;

  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      textAlign: alignnment ?? TextAlign.start,
      maxLines: maxTextlines,
      style: GoogleFonts.urbanist(
          fontSize: textsize ?? 15,
          fontWeight: FontWeight.w600,
          color: tittleColor ?? AppColor.submitBtnTextBlack),
    );
  }
}
