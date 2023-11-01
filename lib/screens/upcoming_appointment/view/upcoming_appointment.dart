import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paitentapp/screens/cancel_appointment.dart/view/cancel_appointment.dart';
import '../../../constants/color/app_colors.dart';
import '../../../constants/dimensions/app_dimensions.dart';
import '../../../constants/screen_size/app_screen_size.dart';
import '../../../widgets/app_button/back_button.dart';
import '../../../widgets/app_button/submit_button.dart';
import '../../../widgets/app_text/app_text.dart';
import '../../welcome_screen/view/welcome_screen.dart';

class UpcomingAppointmentScreen extends StatelessWidget {
  const UpcomingAppointmentScreen({super.key});

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
                      Get.offAll(
                        const WelcomeScreen(),
                        transition: Transition.fadeIn,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 400),
                      );
                    },
                    text: "Home Page",
                    textColor: AppColor.submitBtnTextWhite,
                    borderColor: AppColor.primaryBtnBorderColor),
                const SizedBox(
                  height: 10,
                ),
                SubmitButton(
                  onTap: () {
                    Get.to(
                      // '/RegisterScreen',
                      const CancelAppointmentScreen(),
                      transition: Transition.rightToLeft,
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 300),
                    );
                  },
                  text: "Cancel appointment",
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimension().screenContaintPadding),
            child: Column(
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
                  tittle: 'Upcoming Appointment',
                  maxTextlines: 2,
                ),
                SizedBox(
                  height: ScreenSize.height(context) <= 700 ? 30 : 40, //46
                ),
                detailsFieldWidget(heading: "Name:", dec: "Patient-Name-01"),
                const SizedBox(
                  height: 40,
                ),
                detailsFieldWidget(
                    heading: "Ph. No.:", dec: "+221- XX XXX XX XX"),
                const SizedBox(
                  height: 40,
                ),
                detailsFieldWidget(
                    heading: "Location:", dec: "HealthCareCenter-01"),
                const SizedBox(
                  height: 40,
                ),
                detailsFieldWidget(
                    heading: "Address:", dec: "HealthCareCenter-01"),
                const SizedBox(
                  height: 40,
                ),
                detailsFieldWidget(heading: "Time:", dec: "11:00 AM"),
                const SizedBox(
                  height: 40,
                ),
                detailsFieldWidget(heading: "Confirmation Code:", dec: "VX56Y"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row detailsFieldWidget({required String heading, required String dec}) {
    return Row(
      children: [
        BodySubTittleText(
          tittle: heading,
          fontweight: FontWeight.bold,
          tittleColor: Colors.black,
        ),
        const SizedBox(
          width: 05,
        ),
        Text(
          dec,
          textAlign: TextAlign.start,
          maxLines: 3,
          style: GoogleFonts.roboto(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400, // regular
              color: Colors.black),
        ),
      ],
    );
  }
}
