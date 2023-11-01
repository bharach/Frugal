import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/color/app_colors.dart';
import '../../../constants/dimensions/app_dimensions.dart';
import '../../../constants/screen_size/app_screen_size.dart';
import '../../../widgets/app_button/back_button.dart';
import '../../../widgets/app_button/submit_button.dart';
import '../../../widgets/app_text/app_text.dart';

class AppointmentConfirmationScreen extends StatelessWidget {
  const AppointmentConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
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
                  //   Get.to(const WelcomeScreen(),
                  //   transition: Transition.fadeIn,
                  //       curve: Curves.easeOut,
                  //       duration: const Duration(milliseconds: 400),
                  // );
                },
                text: "Appointment Details",
                textColor: AppColor.submitBtnTextWhite,
                borderColor: AppColor.primaryBtnBorderColor),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child:
           Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimension().screenContaintPadding),
            child: 
            Column(
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
                  tittle: 'The Appointment has been Confirmed',
                  maxTextlines: 2,
                ),
                const SizedBox(
                  height: 30,
                ),
                BodySubTittleText(
                  tittle:
                      'Patient should make sure to bring the following Confirmation Code to the appointment. An appointment confirmation message with the details will be sent to the patient phone number shortly.',
                  maxTextlines: 10,
                  lineheight: 1.3,
                ),
                SizedBox(
                  height: ScreenSize.height(context) <= 700 ? 60 : 100,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/icons/successMark.png",
                        height: ScreenSize.height(context) <= 700 ? 70 : 100,
                        width: ScreenSize.height(context) <= 700 ? 70 : 100,
                        filterQuality: FilterQuality.high,
                      ),
                      SizedBox(
                        height: ScreenSize.height(context) <= 700 ? 40 : 60,
                      ),
                      const TxtFldTittleText(
                        tittle: "Confirmation Code\nVX56Y",
                        alignnment: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        
        
        ),
      ),
    );
  
  
  }
}
