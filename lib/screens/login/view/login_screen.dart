import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paitentapp/screens/otp_screen/view/otp_screen.dart';
import 'package:paitentapp/widgets/app_textfield/app_textfield.dart';

import '../../../constants/color/app_colors.dart';
import '../../../constants/dimensions/app_dimensions.dart';
import '../../../constants/screen_size/app_screen_size.dart';
import '../../../widgets/app_button/back_button.dart';
import '../../../widgets/app_button/submit_button.dart';
import '../../../widgets/app_text/app_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.screenBgColor,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: ScreenSize.height(context) * 0.05),
          child: SizedBox(
            height: 55,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppDimension().subMitBtnPadding),
              child: SubmitButton(
                  onTap: () {
                    Get.to(const OTPScreen(),
                      transition: Transition.rightToLeft,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 300),
                    );
                  },
                  text: "Get OTP",
                  textColor: AppColor.submitBtnTextWhite,
                  borderColor: AppColor.primaryBtnBorderColor),
            ),
          ),
        ),

        body: SafeArea(
          child: Form(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimension().screenContaintPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    AppBackButton(
                      onTap: () {
                        Get.back();
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/sayap.png",
                            filterQuality: FilterQuality.high,
                            height: ScreenSize.height(context) * 0.25,
                            width: ScreenSize.height(context) * 0.25,
                          ),
                          const AppTiitleText(
                            tittle: "GUISS DOCTOR",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: ScreenSize.height(context) *
                          (ScreenSize.height(context) < 700 ? 0.05 : 0.1),
                      // height: ScreenSize.height(context) * 0.1,
                    ),
                    const TxtFldTittleText(
                      tittle: "Enter Mobile Number",
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InputTextField(
                      hint: "+221-XXX-XXXX-XXX",
                      inputType: TextInputType.emailAddress,
                      onTextChanged: (_) {},
                      onValidator: (_) {
                        return null;
                      },
                      secureText: false,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: () {
                                // print('Link tapped!');
                              },
                              child: const LinkText(
                                  tittle: "I have trouble signing in"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
