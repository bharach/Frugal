import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:patientapp/Models/logindetail.dart';
import 'package:patientapp/constants/color/app_colors.dart';
import 'package:patientapp/screens/dashboard/dashboard.dart';
import 'package:patientapp/screens/registration/successregscreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/dimensions/app_dimensions.dart';
import '../../constants/screen_size/app_screen_size.dart';
import '../../widgets/app_button/back_button.dart';
import '../../widgets/app_button/submit_button.dart';
import '../../widgets/app_text/app_text.dart';

class otpAuthScreen extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;
  final bool login;
  const otpAuthScreen(
      {super.key,
      required this.verificationId,
      required this.phoneNumber,
      required this.login});

  @override
  State<otpAuthScreen> createState() => _otpAuthScreenState();
}

class _otpAuthScreenState extends State<otpAuthScreen> {
  final OtpFieldController controll = OtpFieldController();
  String otppin = '';

  @override
  void dispose() {
    //clear the field inputs
    super.dispose();
  }

  Future<void> verifyPhoneNumber(
      {required String verificationId, required String otpcode}) async {
    String uid = '';
    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpcode,
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);

      if (userCredential.user != null) {
        uid = userCredential.user!.uid;
        print("Manual Verification Success: ${uid}");

        if (!widget.login) {
          Navigator.push(
              context as BuildContext,
              MaterialPageRoute(
                  builder: (context) =>
                      SuccessReg(userCredential: userCredential)));
        } else {
          FirebaseFirestore _firestore = FirebaseFirestore.instance;
          print(uid);
          var snap = await _firestore
              .collection('users')
              .where('uid', isEqualTo: uid)
              .get();

          if (snap.docs.isNotEmpty) {
            Logindetail detail = Logindetail(
                phonenumber: snap.docs[0].data()['phoneNumber'],
                name: snap.docs[0].data()['name'],
                dob: snap.docs[0].data()['dob'],
                email: snap.docs[0].data()['email'],
                uid: snap.docs[0].data()['uid'],
                docid: snap.docs[0].id);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => DashboardScreen(logindetail: detail),
              ),
              (route) => false,
            );
            /*
            Navigator.push(
                context as BuildContext,
                MaterialPageRoute(
                    builder: (context) => DashboardScreen(
                          logindetail: detail,
                        )));
                        */
          } else {
            print('no data picked');
          }
        }
      } else {
        print('Error occured');
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> saveUserDetails(String username, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('email', email);
  }

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
                  verifyPhoneNumber(
                      verificationId: widget.verificationId, otpcode: otppin);
                },
                text: AppLocalizations.of(context)!.translate15,
                
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
                  tittle: AppLocalizations.of(context)!.translate12,
                ),
                const SizedBox(
                  height: 10,
                ),
                BodySubTittleText(
                  tittle:
                      '${AppLocalizations.of(context)!.translate13} ${widget.phoneNumber}',
                  maxTextlines: 2,
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: OTPTextField(
                    length: 6,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    otpFieldStyle: OtpFieldStyle(
                        // enabledBorderColor: AppColor.otpEnableBorderColor,
                        backgroundColor: AppColor.otpDefaultBGColor,
                        borderColor: AppColor.otpDefaultBorderColor,
                        errorBorderColor: AppColor.otpErrorBorderColor,
                        focusBorderColor: AppColor.otpFocusBorderColor
                        // focusBorderColor: AppColor.otpEnableBorderColor
                        ),
                    width: MediaQuery.of(context).size.width,
                    keyboardType: TextInputType.number,
                    outlineBorderRadius: 10,
                    spaceBetween: 05,
                    fieldWidth: (MediaQuery.of(context).size.width / 8),
                    style: GoogleFonts.urbanist(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColor.mainTitleTextColor),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.box,
                    onChanged: (val) {},
                    onCompleted: (pin) {
                      otppin = pin;
                      // widget.con.OTP = pin;
                    },
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
