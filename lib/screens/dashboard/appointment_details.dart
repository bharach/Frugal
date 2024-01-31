import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patientapp/Models/logindetail.dart';
import 'package:patientapp/Models/patientdetail.dart';
import 'package:patientapp/constants/color/app_colors.dart';
import 'package:patientapp/screens/dashboard/dashboard.dart';
import '../../../constants/dimensions/app_dimensions.dart';
import '../../../constants/screen_size/app_screen_size.dart';
import '../../../widgets/app_button/back_button.dart';
import '../../../widgets/app_button/submit_button.dart';
import '../../../widgets/app_text/app_text.dart';

class AppointDetailsScreen extends StatefulWidget {
  final AppointmentData data;
  const AppointDetailsScreen({super.key, required this.data});

  @override
  State<AppointDetailsScreen> createState() => _AppointDetailsScreenState();
}

class _AppointDetailsScreenState extends State<AppointDetailsScreen> {
  Logindetail logindetail = Logindetail(
      phonenumber: 'phonenumber',
      name: 'name',
      dob: 'dob',
      email: '',
      uid: '',
      docid: '');

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
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                text: "Home",
                textColor: AppColor.submitBtnTextWhite,
                borderColor: AppColor.primaryBtnBorderColor),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimension().screenContaintPadding,
              vertical: 20, // Adjust the vertical padding as needed
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 30,
                ),
                const MainTittleText(
                  tittle: 'Appointment Details',
                  maxTextlines: 2,
                ),
                SizedBox(
                  height: ScreenSize.height(context) <= 700 ? 30 : 40,
                ),
                detailsFieldWidget(
                  heading: "Name:",
                  dec: widget.data.patientName,
                ),
                const SizedBox(
                  height: 40,
                ),
                detailsFieldWidget(
                  heading: "Ph. No.:",
                  dec: widget.data.phoneNumber,
                ),
                const SizedBox(
                  height: 40,
                ),
                detailsFieldWidget(
                  heading: "Location:",
                  dec: widget.data.hospitalName,
                ),
                const SizedBox(
                  height: 40,
                ),
                detailsFieldWidget(
                  heading: "Address:",
                  dec: widget.data.address,
                ),
                const SizedBox(
                  height: 40,
                ),
                detailsFieldWidget(
                  heading: "Doctor:",
                  dec: widget.data.doctorName,
                ),
                const SizedBox(
                  height: 40,
                ),
                detailsFieldWidget(
                  heading: "Date:",
                  dec: widget.data.appointmentTime.toString().substring(0, 10),
                ),
                const SizedBox(
                  height: 40,
                ),
                detailsFieldWidget(
                  heading: "Time:",
                  dec: widget.data.appointmentTime.toString().substring(10, 16),
                ),
                const SizedBox(
                  height: 40,
                ),
                detailsFieldWidget(
                  heading: "Confirmation Code:",
                  dec: widget.data.confirmationCode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row detailsFieldWidget({required String heading, required String dec}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BodySubTittleText(
          tittle: heading,
          fontweight: FontWeight.bold,
          tittleColor: Colors.black,
        ),
        const SizedBox(
          width: 8, // Adjust the spacing between heading and text
        ),
        Expanded(
          child: Text(
            dec,
            textAlign: TextAlign.start,
            maxLines: 3,
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
