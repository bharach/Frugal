import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:patientapp/Models/verifymodel.dart';
import 'package:patientapp/resources/firebasefire.dart';
import 'package:patientapp/screens/registration/otpauthscreen.dart';
import 'package:patientapp/resources/firebaseAuth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants/color/app_colors.dart';
import '../../constants/dimensions/app_dimensions.dart';
import '../../constants/screen_size/app_screen_size.dart';
import '../../widgets/app_button/back_button.dart';
import '../../widgets/app_button/submit_button.dart';
import '../../widgets/app_text/app_text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //Editing COntroller, for input Field nmae,dob and Phone Number for Appointment
  final RegExp datePattern = RegExp(r'^\d{4}-\d{2}-\d{2}$');
  final FirestoreMethods _firestore = FirestoreMethods();
  final FirebaseAuthmethods _auth = FirebaseAuthmethods();
  String verifyId = '';
  String number = '';

  void snackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void dispose() {
    //clear the field inputs
    super.dispose();
  }

  void register(String number) async {
    bool registered = await _firestore.checkUser(phonenumber: number);
    if (registered == false) {
      VerifyModel verify = await _auth.verifyPhone(number: number);
      if (verify.status) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => otpAuthScreen(
                    verificationId: verify.verificationId,
                    phoneNumber: number,
                    login: false)));
      }
    } else {
      snackBar(AppLocalizations.of(context)!.translate10);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: ScreenSize.height(context) * 0.05),
        child: SizedBox(
          height: 55,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimension().subMitBtnPadding),
            child: SubmitButton(
                onTap: () {
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
                // const SizedBox(
                //   height: 180,
                // ),
                
              ],
            ),
          ),
        ),
      ),
    );

    // Scaffold(
    //   appBar: AppBar(),
    //   body: Stack(children: [
    //     SafeArea(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           const SizedBox(
    //             height: 20,
    //           ),
    //           const Center(
    //             child: Image(
    //               image: AssetImage('assets/images/sayap_africa3.png'),
    //               width: 200,
    //             ),
    //           ),
    //           const SizedBox(height: 20),
    //           Padding(
    //             padding: const EdgeInsets.only(left: 20),
    //             child: Text(
    //               AppLocalizations.of(context)!.translate4,
    //               style: const TextStyle(
    //                 fontSize: 25,
    //                 fontWeight: FontWeight.bold,
    //                 fontFamily: 'Plasto',
    //                 letterSpacing: 2,
    //               ),
    //               textAlign: TextAlign.left,
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 10,
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(20.0),
    //             child: IntlPhoneField(
    //                 invalidNumberMessage:
    //                     AppLocalizations.of(context)!.translate5,
    //                 decoration: InputDecoration(
    //                   labelText: AppLocalizations.of(context)!.translate6,
    //                   contentPadding: const EdgeInsets.all(5),
    //                   filled: true,
    //                   border: OutlineInputBorder(
    //                       borderSide: Divider.createBorderSide(context)),
    //                   focusedBorder: OutlineInputBorder(
    //                       borderSide: Divider.createBorderSide(context)),
    //                   enabledBorder: OutlineInputBorder(
    //                       borderSide: Divider.createBorderSide(context)),
    //                 ),
    //                 onChanged: (phone) {
    //                   number = phone.completeNumber;
    //                   //  print(number);
    //                 },
    //                 //controller: _phoneconctroller,
    //                 initialCountryCode: 'US'),
    //           ),
    //           const SizedBox(
    //             height: 180,
    //           ),
    //           const SizedBox(height: 10),
    //           Center(
    //             child: ElevatedButton(
    //                 onPressed: () {
    //                   register(number);
    //                   _firestore.checkUser(phonenumber: number);
    //                 },
    //                 style: ElevatedButton.styleFrom(
    //                     minimumSize: const Size(350, 50),
    //                     backgroundColor: const Color.fromARGB(200, 8, 65, 10)),
    //                 child: Text(AppLocalizations.of(context)!.translate7)),
    //           ),
    //           const SizedBox(
    //             height: 50,
    //           ),
    //         ],
    //       ),
    //     )
    //   ]),
    // );
  }
}
