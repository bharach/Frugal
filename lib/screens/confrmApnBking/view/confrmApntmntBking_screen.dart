// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paitentapp/constants/color/app_colors.dart';

import '../../../constants/dimensions/app_dimensions.dart';
import '../../../constants/screen_size/app_screen_size.dart';
import '../../../widgets/app_button/back_button.dart';
import '../../../widgets/app_button/submit_button.dart';
import '../../../widgets/app_text/app_text.dart';

class ConfrmApntmntBooking extends StatelessWidget {
  const ConfrmApntmntBooking({super.key});

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
                text: "Confirm and Add Details",
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
                    tittle: 'Confirm your Appointment Booking',
                    maxTextlines: 2,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BodySubTittleText(
                    tittle:
                        'Please confirm the Appointment slot you have selected in the previous screen to proceed forward to payment.',
                    maxTextlines: 5,
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //! Booking Details
                  Container(
                    width: ScreenSize.width(context),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    decoration: BoxDecoration(
                      color: AppColor.detailsContainerBgColor,
                      border: Border.all(
                        color: AppColor.detailsContainerBORDERColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        detailsField(headind: "Date",details: "4 October 2023, 11 h 00"),
                        const SizedBox(
                          height: 25,
                        ),
                        detailsField(headind: "Location",details: "Dakar Regoinal Hospital"),


                         const SizedBox(
                          height: 25,
                        ),
                        detailsField(headind: "Address",details: "163-157 Rue Mousse Diop, Dakar, Senegal"),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
 
 
  }

  Column detailsField({required String headind, required details}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BodySubTittleText(
          tittle: headind,
          fontweight: FontWeight.bold,
          tittleColor: Colors.black,
        ),
        const SizedBox(
          height: 03,
        ),
        Text(
          details,
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
