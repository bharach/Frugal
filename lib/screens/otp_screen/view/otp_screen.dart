import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constants/color/app_colors.dart';
import '../../../constants/dimensions/app_dimensions.dart';
import '../../../constants/screen_size/app_screen_size.dart';
import '../../../widgets/app_button/back_button.dart';
import '../../../widgets/app_button/submit_button.dart';
import '../../../widgets/app_text/app_text.dart';
import '../../welcome_screen/view/welcome_screen.dart';
import '../component/otp_form.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child:
      
       Scaffold(
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
                      Get.to(const WelcomeScreen(),
                      transition: Transition.fadeIn,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 400),
                    );
                  },
                  text: "Login",
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
                    const MainTittleText(
                      tittle: 'OTP Verification',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BodySubTittleText(
                      tittle:
                          'Enter the One Time Password sent to your Registered Mobile Number.',
                      maxTextlines: 2,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const OtpForm(),
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
