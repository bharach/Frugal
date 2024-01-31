import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/color/app_colors.dart';
import '../../../constants/dimensions/app_dimensions.dart';
import '../../../constants/screen_size/app_screen_size.dart';
import '../../../widgets/app_button/back_button.dart';
import '../../../widgets/app_button/submit_button.dart';
import '../../../widgets/app_text/app_text.dart';
import 'appointment_cacelled.dart.dart';
import 'booked_appointments.dart';

class CancelAppointmentScreen extends StatelessWidget {
  const CancelAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.screenBgColor,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: ScreenSize.height(context) * 0.05),
        child: SizedBox(
          height: 130,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimension().subMitBtnPadding),
            child: Column(
              children: [
                SubmitButton(
                    onTap: () {
                      Get.to(
                        // '/LoginScreen',
                        const AppointmentCancelledScreen(),
                        transition: Transition.rightToLeft,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 300),
                      );
                    },
                    text: "Yes, Cancel this appointment",
                    textColor: AppColor.submitBtnTextWhite,
                    borderColor: AppColor.primaryBtnBorderColor),
                const SizedBox(
                  height: 15,
                ),
                SubmitButton(
                  onTap: () {
                    // Get.to(
                    //     // '/RegisterScreen',
                    //     const BookedAppointsScreen(),
                    //     transition: Transition.rightToLeft,
                    //     curve: Curves.easeOut,
                    //     duration: const Duration(milliseconds: 300),
                    //   );
                  },
                  text: "No, do not cancel this appointment.",
                  textColor: AppColor.submitBtnTextBlack,
                  backgroundColor: AppColor.backgroundColor,
                  borderColor: AppColor.blackBtnBorderColor,
                ),
              ],
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimension().screenContaintPadding),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              tittle: 'Cancel Appointment',
              maxTextlines: 2,
            ),
            const SizedBox(
              height: 30,
            ),
            const BodyTittleText(
              tittle: 'Are you sure you want to\ncancel this appointment?',
              maxTextlines: 10,
              lineHeightight: 1.3,
              fontweight: FontWeight.w600,
            ),
            SizedBox(
              height: ScreenSize.height(context) <= 700 ? 60 : 100,
            ),
          ]),
        ),
      ),
    );
  }
}
