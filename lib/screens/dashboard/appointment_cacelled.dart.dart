import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patientapp/screens/homepage.dart';

import '../../../constants/color/app_colors.dart';
import '../../../constants/dimensions/app_dimensions.dart';
import '../../../constants/screen_size/app_screen_size.dart';
import '../../../widgets/app_button/back_button.dart';
import '../../../widgets/app_button/submit_button.dart';
import '../../../widgets/app_text/app_text.dart';

class AppointmentCancelledScreen extends StatelessWidget {
  const AppointmentCancelledScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                    Get.offAll(const HomePage(),
                    transition: Transition.fadeIn,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 400),
                  );
                },
                text: "Home",
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
                  tittle: 'Your Appointment has been Cancelled',
                  maxTextlines: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                BodySubTittleText(
                  tittle:
                      'If you need another appointment, please book using the dashboard screen.',
                  maxTextlines: 10,
                  lineheight: 1.3,
                  fontweight: FontWeight.w500,
                ),
                SizedBox(
                  height: ScreenSize.height(context) <= 700 ? 50 : 80,
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
                        tittle: "Your Appointment has been\ncancelled.",
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