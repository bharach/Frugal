import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/color/app_colors.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    Key? key,
    this.textEditingController,
    required this.hint,
    required this.onTextChanged,
    required this.secureText,
    required this.onValidator,
    this.iconSuffix,
    required this.inputType,
  }) : super(key: key);

  final TextEditingController? textEditingController;
  final String hint;
  final bool secureText;
  final Function(String)? onTextChanged;
  final FormFieldValidator<String>? onValidator;
  final IconButton? iconSuffix;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onChanged: onTextChanged,
      cursorColor: Colors.teal,
      obscureText: secureText,
      keyboardType: inputType,
      validator: onValidator,
      decoration: InputDecoration(
        fillColor: AppColor.textFiledBgColor,
        filled: true,
        border: InputBorder.none,
        contentPadding: const EdgeInsets.all(12),
        hintText: hint,
        hintStyle: GoogleFonts.urbanist(
            fontSize: 15, // 15
            // fontSize: ScreenSize.width(context) < 360
            //     ? ScreenSize.width(context) * 0.03
            //     : ScreenSize.width(context) * 0.05,
            fontWeight: FontWeight.w500, // Medium
            color: AppColor.hintTitleTextColor),
        suffixIcon: iconSuffix ?? const SizedBox(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(05),
          borderSide:
              const BorderSide(color: AppColor.textFiledBorderColor, width: 1),
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
    );
  }
}

class DetailsTextField extends StatelessWidget {
  const DetailsTextField({
    Key? key,
    this.textEditingController,
    required this.hint,
    required this.onTextChanged,
    required this.secureText,
    required this.onValidator,
    this.iconSuffix,
    required this.inputType,
  }) : super(key: key);

  final TextEditingController? textEditingController;
  final String hint;
  final bool secureText;
  final Function(String)? onTextChanged;
  final FormFieldValidator<String>? onValidator;
  final IconButton? iconSuffix;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onChanged: onTextChanged,
      cursorColor: Colors.teal,
      obscureText: secureText,
      keyboardType: inputType,
      validator: onValidator,
      decoration: InputDecoration(
        fillColor: AppColor.detailsTextFiledBgColor,
        filled: true,
        border: InputBorder.none,
        contentPadding: const EdgeInsets.all(12),
        hintText: hint,
        hintStyle: GoogleFonts.urbanist(
            fontSize: 13, // 15
            // fontSize: ScreenSize.width(context) < 360
            //     ? ScreenSize.width(context) * 0.03
            //     : ScreenSize.width(context) * 0.05,
            fontWeight: FontWeight.w500, // Medium
            color: AppColor.hintTitleTextColor),
        suffixIcon: iconSuffix ?? const SizedBox(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(05),
          borderSide:
              const BorderSide(color: AppColor.textFiledBorderColor, width: 1),
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
    );
  }
}

oTPtextField(
    {required BuildContext context,
    required void Function(String?)? onsaved,
    required void Function(String)? onchanged}) {
  return SizedBox(
    height: 64,
    width: 68,
    child: TextFormField(
      autofocus: true,
      onSaved: onsaved,
      onChanged: onchanged,
      keyboardType: TextInputType.number,
      maxLength: 1,
      decoration:
          const InputDecoration(counterText: "", border: OutlineInputBorder()),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleLarge,
    ),
  );
}
