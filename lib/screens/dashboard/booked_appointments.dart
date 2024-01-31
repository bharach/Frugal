import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patientapp/Models/patientdetail.dart';
import 'package:patientapp/resources/firebasefire.dart';
import '../../../constants/color/app_colors.dart';
import '../../../constants/dimensions/app_dimensions.dart';
import '../../../constants/screen_size/app_screen_size.dart';
import '../../../widgets/app_button/submit_button.dart';
import '../../../widgets/app_text/app_text.dart';
import 'dart:developer';

class BookedAppointsScreen extends StatefulWidget {
  final String userId;
  const BookedAppointsScreen({super.key, required this.userId});

  @override
  State<BookedAppointsScreen> createState() => _BookedAppointsScreenState();
}

class _BookedAppointsScreenState extends State<BookedAppointsScreen> {
  List<AppointmentData> booked_appointments = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAppointmentListing();
    setState(() {});
  }

  void getAppointmentListing() async {
    try {
      booked_appointments =
          (await FirestoreMethods().getAppoint(userId: widget.userId))!;
      if (booked_appointments.isNotEmpty) {
        print("booked");
        setState(() {});
      }
    } catch (e) {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      backgroundColor: AppColor.screenBgColor,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: ScreenSize.height(context) * 0.05),
        child: SizedBox(
          height: 55,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimension().subMitBtnPadding),
            child: SubmitButton(
                onTap: () {},
                text: "Home Page",
                textColor: AppColor.submitBtnTextWhite,
                borderColor: AppColor.primaryBtnBorderColor),
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimension().screenContaintPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 30,
              ),
              const MainTittleText(
                tittle: 'Booked Appointment',
                maxTextlines: 2,
              ),
              const SizedBox(
                height: 15, //46
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const Divider(height: 15, color: Colors.transparent),
                  itemCount: booked_appointments.length,
                  itemBuilder: (context, index) {
                    var data = booked_appointments[index];
                    return GestureDetector(
                      onTap: () {
                        //add here
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 15),
                        // height: 315,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.detailsContainerBgColor,
                          borderRadius: BorderRadius.circular(25),
                          border:
                              Border.all(width: 0, color: Colors.transparent),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BodyTittleText(
                              tittle: data.appointmentTime.toString(),
                            ),
                            const SizedBox(height: 20),
                            bookedAppintFiledWidget(
                                tittle: "Location:",
                                desc: data.hospitalName.toString()),
                            const SizedBox(height: 20),
                            bookedAppintFiledWidget(
                                tittle: "Visited by:",
                                desc: data.doctorSpec.toString()),
                            const SizedBox(height: 20),
                            bookedAppintFiledWidget(
                                tittle: "Appointment for:",
                                desc: data.patientName.toString()),
                            const SizedBox(height: 20),
                            Container(
                              // height: 30,
                              // alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(
                                  left: 15, right: 30, top: 7, bottom: 7),

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: BodySubTittleText(
                                tittle:
                                    'Confirmation Code: ${data.confirmationCode.toString()}',
                                tittleColor: AppColor.bodytitleTextColorBlack,
                                maxTextlines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bookedAppintFiledWidget({required tittle, required String desc}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTittleText(
          tittle: tittle,
          textSize: 12,
          tittleColor: const Color(0xff666666),
          textWeight: FontWeight.w800,
        ),
        const SizedBox(
          height: 03,
        ),
        BodySubTittleText(
          tittle: desc,
        )
      ],
    );
  }
}
