import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:patientapp/Models/verifymodel.dart';
import 'package:patientapp/screens/registration/otpauthscreen.dart';
import 'package:patientapp/widgets/snackBar.dart';
import 'package:patientapp/resources/firebaseAuth.dart';
import 'package:patientapp/resources/firebasefire.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants/color/app_colors.dart';
import '../../constants/dimensions/app_dimensions.dart';
import '../../constants/screen_size/app_screen_size.dart';
import '../../widgets/app_button/back_button.dart';
import '../../widgets/app_button/submit_button.dart';
import '../../widgets/app_text/app_text.dart';
import '../../widgets/app_textfield/app_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //definitions

  final FirebaseAuthmethods _auth = FirebaseAuthmethods();
  final FirestoreMethods _firestore = FirestoreMethods();
  //final TextEditingController _phone = TextEditingController();
  // late final VerifyModel verify;
  String number = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void SignIn(String number) async {
//check if user exists
    bool check = await _firestore.checkUser(phonenumber: number);
    if (check != true) {
      snackBar(context, AppLocalizations.of(context)!.translate3);
    } else {
      //if true verifyPhone Number
      //  print('before');
      VerifyModel verify = await _auth.verifyPhone(number: number);

      // print('after: ${verify.verificationId}');
      if (verify.status) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => otpAuthScreen(
                      verificationId: verify.verificationId,
                      phoneNumber: number,
                      login: true,
                    )));
      }
    }
  }

/*
  //checkuser
  Future<void> signIn({required String number}) async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    try {
      var snap = await _firestore
          .collection('users')
          .where('phoneNumber', isEqualTo: number)
          .get();

      if (snap.docs.isEmpty) {
        snackBar(context, 'The Phone Number is not Availble,Please try again');
      } else {
        verifyPhone();
      }
    } catch (error) {
      print(error);
    }
  }
  */
/*
  Future<void> verifyPhone() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      _auth.verifyPhoneNumber(
          phoneNumber: number,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await _auth.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseAuthException exep) {
            print(exep);
          },
          codeSent: (String verificationId, int? resendTocken) {
            print('Code Sent : $verificationId');
            print('number:  $number');
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => otpAuthScreen(
                          verificationId: verificationId,
                          phoneNumber: number,
                          login: true,
                        )));
          },
          codeAutoRetrievalTimeout: (String verificationid) {
            print('$verificationid');
          });
    } catch (error) {
      print(error);
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                  SignIn(number);
                },
                text: AppLocalizations.of(context)!.translate7,
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
                    //  print("   Get.back();");
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/sayap.png",
                        filterQuality: FilterQuality.high,
                        height: ScreenSize.height(context) * 0.25,
                        width: ScreenSize.height(context) * 0.25,
                      ),
                      AppTiitleText(
                        tittle: AppLocalizations.of(context)!.translate0,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenSize.height(context) *
                      (ScreenSize.height(context) < 700 ? 0.05 : 0.1),
                  // height: ScreenSize.height(context) * 0.1,
                ),
               
               
                TxtFldTittleText(
                  tittle: AppLocalizations.of(context)!.translate4,
                ),
                const SizedBox(
                  height: 25,
                ),
                IntlPhoneField(
                    invalidNumberMessage:
                        AppLocalizations.of(context)!.translate5,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.translate6,
                      contentPadding: const EdgeInsets.all(5),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: Divider.createBorderSide(context)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: Divider.createBorderSide(context)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: Divider.createBorderSide(context)),
                    ),
                    onChanged: (phone) {
                      number = phone.completeNumber;
                      //  print(number);
                    },
                    //controller: _phoneconctroller,
                    initialCountryCode: 'US'),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            // print('Link tapped!');
                          },
                          child: LinkText(
                              tittle:
                                  AppLocalizations.of(context)!.translate76),
                        ),
                      ),
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
