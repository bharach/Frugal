import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:patientapp/Models/patientdetail.dart';
import 'package:patientapp/screens/dashboard/appointment_confirmed.dart';
import 'package:patientapp/screens/login/loginscreen.dart';
import 'package:patientapp/resources/firestoreAppoint.dart';

import '../../constants/color/app_colors.dart';
import '../../constants/dimensions/app_dimensions.dart';
import '../../constants/screen_size/app_screen_size.dart';
import '../../widgets/app_button/back_button.dart';
import '../../widgets/app_button/submit_button.dart';
import '../../widgets/app_text/app_text.dart';
import 'confrmApntmntBking_screen.dart';

class AppointmentAvail extends StatefulWidget {
  final AppointmentData? data;

  const AppointmentAvail({required this.data});

  @override
  State<AppointmentAvail> createState() => _AppointmentAvailState();
}

class _AppointmentAvailState extends State<AppointmentAvail> {
  final appointDates = <DateTime>[];
  List<DateTime> multilist = [];

  @override
  void initState() {
    super.initState();
    getappointments();
  }

  Future<void> getappointments() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    DateTime day = DateTime(widget.data!.date.year, widget.data!.date.month,
        widget.data!.date.day, 0, 0, 0);

    try {
      multilist = await FirestoreAppoint().getAvailabilities(
          hospitalid: widget.data!.hospitalId,
          doctorid: widget.data!.doctorId,
          datetime: widget.data!.date);
      /*
      var appointmets = await _firestore
          .collection('Appointments')
          .where('Day', isEqualTo: day)
          .get();

      if (appointmets.docs.isNotEmpty) {
        for (int i = 0; i < appointmets.docs.length; i++) {
          appointDates.add(
            (appointmets.docs[i].data()['TimeUnit']['AptStarttime']).toDate(),
          );
          multilist.add([
            (appointmets.docs[i].data()['TimeUnit']['AptStarttime']).toDate(),
            appointmets.docs[i].data()['Booking']['confirmationCode'] ?? ''
          ]);
        }
        multilist.sort(((a, b) => a[0].compareTo(b[0])));
      }
      */
    } catch (error) {
      print(error);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => ConfrmApntmntBooking(),
                  //     ));
                },
                text: "Next",
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
              const SizedBox(
                height: 10,
              ),
              AppBackButton(
                onTap: () {
                  Get.back();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              MainTittleText(
                tittle: AppLocalizations.of(context)!.translate68,
                maxTextlines: 2,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                AppLocalizations.of(context)!.translate69,
                style: GoogleFonts.urbanist(
                    fontSize: 14, //16
                    height: 2.0,
                    fontWeight: FontWeight.w500, // Medium
                    color: AppColor.bodysubTitleTextColor),
              ),
              const SizedBox(
                height: 30,
              ),
              if (multilist.isNotEmpty)
                Center(
                  child: SizedBox(
                    height: 510,
                    width: 360,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 25,
                              crossAxisSpacing: 30,
                              childAspectRatio: 3),
                      itemCount: multilist.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: ScreenSize.width(context) / 3,
                          alignment: Alignment.center,
                          // padding: const EdgeInsets.symmetric(
                          //     horizontal: 20, vertical: 12), //24 , 14
                          decoration: BoxDecoration(
                            color: AppColor.selectTiemeSlotBtnColor,
                            borderRadius: BorderRadius.circular(17),
                          ), // Add margin for spacing
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                widget.data!.appointmentTime = multilist[index];
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                           
                                ConfrmApntmntBooking(
                                    data: widget.data!)));
                              });
                            },
                            highlightColor: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${DateFormat.H().format(multilist[index])} h ${DateFormat.m().format(multilist[index])}',
                                  style: const TextStyle(
                                    fontSize: 14.0, // Adjust the font size
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              else if (multilist.isEmpty)
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(AppLocalizations.of(context)!.translate68),
                )
              else
                const Center(
                  child:
                      CircularProgressIndicator(backgroundColor: Colors.blue),
                ),
            ],
          ),
        ),
      ),
    );
  }
}