// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../constants/dimensions/app_dimensions.dart';
import '../../../constants/screen_size/app_screen_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Models/patientdetail.dart';
import '../../constants/color/app_colors.dart';
import '../../widgets/app_button/back_button.dart';
import '../../widgets/app_button/submit_button.dart';
import '../../widgets/app_text/app_text.dart';
import 'patient_details_screen.dart';

class ConfrmApntmntBooking extends StatefulWidget {
  final AppointmentData data;
  const ConfrmApntmntBooking({required this.data});

  @override
  State<ConfrmApntmntBooking> createState() => _ConfrmApntmntBookingState();
}

class _ConfrmApntmntBookingState extends State<ConfrmApntmntBooking> {
  String returndateFormat({required DateTime date}) {
    String data =
        "${DateFormat.yMMMMd().format(date)} ${DateFormat.H().format(date)} h ${DateFormat.m().format(date)}";
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: ScreenSize.height(context) * 0.05),
        child: SizedBox(
          height: 55,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimension().subMitBtnPadding),
            child: SubmitButton(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PatientDetailsScreeen(data: widget.data)));
                },
                text: AppLocalizations.of(context)!.translate65,
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
                  const SizedBox(
                    height: 10,
                  ),

                  AppBackButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MainTittleText(
                    tittle: AppLocalizations.of(context)!.translate62,
                    maxTextlines: 2,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BodySubTittleText(
                    tittle: AppLocalizations.of(context)!.translate72,
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
                      color: Color(0xffEDF5F4),
                      border: Border.all(
                        color: Color(0xffE8ECF4),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        detailsField(
                            headind: AppLocalizations.of(context)!.translate44,
                            details: widget.data.hospitalName),
                        const SizedBox(
                          height: 25,
                        ),
                        detailsField(
                            headind: AppLocalizations.of(context)!.translate44,
                            details: widget.data.hospitalName),
                        const SizedBox(
                          height: 25,
                        ),
                        detailsField(
                            headind: AppLocalizations.of(context)!.translate49,
                            details: widget.data.address),
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
          details as dynamic,
          textAlign: TextAlign.start,
          maxLines: 3,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400, // regular
              color: Colors.black),
        ),
      ],
    );
  }
}
