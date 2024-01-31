// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patientapp/Models/patientdetail.dart';
import 'package:patientapp/constants/color/app_colors.dart';
import 'package:patientapp/screens/dashboard/appointment_details.dart';
import '../../../constants/dimensions/app_dimensions.dart';
import '../../../constants/screen_size/app_screen_size.dart';
import '../../../widgets/app_button/back_button.dart';
import '../../../widgets/app_button/submit_button.dart';
import '../../../widgets/app_text/app_text.dart';

class AppointmentConfirmationScreen extends StatefulWidget {
  final AppointmentData data;
  const AppointmentConfirmationScreen({super.key, required this.data});

  @override
  State<AppointmentConfirmationScreen> createState() =>
      _AppointmentConfirmationScreenState();
}

class _AppointmentConfirmationScreenState
    extends State<AppointmentConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AppointDetailsScreen(data: widget.data)));
                },
                text: "Appointment Details",
                textColor: AppColor.submitBtnTextWhite,
                borderColor: AppColor.primaryBtnBorderColor),
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
                        "assets/images/successMark.png",
                        height: ScreenSize.height(context) <= 700 ? 70 : 100,
                        width: ScreenSize.height(context) <= 700 ? 70 : 100,
                        filterQuality: FilterQuality.high,
                      ),
                      SizedBox(
                        height: ScreenSize.height(context) <= 700 ? 40 : 60,
                      ),
                      TxtFldTittleText(
                        tittle:
                            "Confirmation Code\n ${widget.data.confirmationCode}.",
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
