import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:patientapp/Models/patientdetail.dart';
import 'package:patientapp/resources/firebasefire.dart';
import 'package:patientapp/resources/firestoreAppoint.dart';
import 'package:patientapp/screens/dashboard/appointment_confirmed.dart';
import 'package:patientapp/widgets/textfield.dart';
import '../../../constants/color/app_colors.dart';
import '../../../constants/dimensions/app_dimensions.dart';
import '../../../constants/screen_size/app_screen_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../widgets/app_button/back_button.dart';
import '../../widgets/app_button/submit_button.dart';
import '../../widgets/app_text/app_text.dart';

class PatientDetailsScreeen extends StatefulWidget {
  final AppointmentData data;
  const PatientDetailsScreeen({super.key, required this.data});

  @override
  State<PatientDetailsScreeen> createState() => _PatientDetailsScreeenState();
}

class _PatientDetailsScreeenState extends State<PatientDetailsScreeen> {
  //Controllers
  final TextEditingController _phonecontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _dobcontroller = TextEditingController();
  //Click Flag
  bool _clicked = false;
  //Regex
  final RegExp datePattern = RegExp(r'^\d{4}-\d{2}-\d{2}$');
  final RegExp emailPattern =
      RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b');

  Future<void> setUnavail() async {
    bool check = await FirestoreAppoint().setUnavailable(widget.data.hospitalId,
        widget.data.doctorId, widget.data.appointmentTime);
    await setAppointment();
    /*if (check == true) {
      print('done');
    
    } else {
      print('Error while adding');
    }*/
  }

  Future<void> setAppointment() async {
    try {
      // Assuming FirestoreMethods().addAppoint() always returns a non-null AppointmentData
      await FirestoreMethods().addAppoint(data: widget.data);
      // Proceed with navigation
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  AppointmentConfirmationScreen(data: widget.data)));
    } catch (error) {
      // Handle other types of errors (e.g., network issues, Firestore exceptions)
      print("Error: $error");
      // You might want to show a generic error message to the user
    }
  }

  String generateConfCode(String dob, String name) {
    int lastTwoDigitsOfYear = int.parse(dob.substring(2, 4));
    int randomValue = Random().nextInt(900) + 100;
    String code = '$lastTwoDigitsOfYear${name.substring(0, 2)}$randomValue';
    return code;
  }

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
                 setState(() {
                  widget.data.patientDOB = _dobcontroller.text;
                  widget.data.patientName = _namecontroller.text;
                  widget.data.phoneNumber = _phonecontroller.text;
                  widget.data.confirmationCode = generateConfCode(
                      widget.data.patientDOB, widget.data.patientName);
                  setUnavail();
                });
                },
                text: "Confirm",
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
                SizedBox(
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
                  tittle: AppLocalizations.of(context)!.translate74,
                  maxTextlines: 2,
                ),
                  const SizedBox(
                  height: 30,
                ),
                BodySubTittleText(
                  tittle:
                      AppLocalizations.of(context)!.translate73,
                  maxTextlines: 5,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFieldInput(
                    textEditingController: _namecontroller,
                    hint: AppLocalizations.of(context)!.translate17,
                    textInputType: TextInputType.name,
                    error: AppLocalizations.of(context)!.translate18,
                    clicked: _clicked),
                TextFieldInput(
                  textEditingController: _dobcontroller,
                  hint: AppLocalizations.of(context)!.translate19,
                  textInputType: TextInputType.datetime,
                  error: _dobcontroller.text.isNotEmpty &&
                          !datePattern.hasMatch(_dobcontroller.text)
                      ? AppLocalizations.of(context)!.translate20
                      : AppLocalizations.of(context)!.translate21,
                  clicked: _clicked,
                ),
                TextFieldInput(
                  textEditingController: _phonecontroller,
                  hint: AppLocalizations.of(context)!.translate4,
                  textInputType: TextInputType.phone,
                  error: _phonecontroller.text.length < 10
                      ? AppLocalizations.of(context)!.translate23
                      : AppLocalizations.of(context)!.translate21,
                  clicked: _clicked,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
