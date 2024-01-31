import 'package:flutter/material.dart';
import 'package:patientapp/Models/logindetail.dart';
import 'package:patientapp/constants/color/app_colors.dart';
import 'package:patientapp/main.dart';
import 'package:patientapp/resources/firebaseAuth.dart';
import 'package:patientapp/screens/dashboard/bookappointmentscreen.dart';
import 'package:patientapp/screens/dashboard/booked_appointments.dart';
import 'package:patientapp/screens/dashboard/profilescreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/dimensions/app_dimensions.dart';
import '../../constants/screen_size/app_screen_size.dart';
import '../../widgets/app_button/submit_button.dart';
import '../../widgets/app_text/app_text.dart';

class DashboardScreen extends StatefulWidget {
  final Logindetail logindetail;

  DashboardScreen({required this.logindetail});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
  }

  final FirebaseAuthmethods _auth = FirebaseAuthmethods();

  void signOut() async {
    await _auth.signOut();
    /* Clear shared*/
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenBgColor,
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.person,
      //       size: 40,
      //       color: Color.fromARGB(200, 8, 65, 10),
      //     ),
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => ProfileScreen(
      //             name: widget.logindetail.name!,
      //             mobile: widget.logindetail.phonenumber!,
      //             email: widget.logindetail.email!,
      //             dob: widget.logindetail.dob!,
      //             userId: widget.logindetail.uid!,
      //           ),
      //         ),
      //       );
      //     },
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: Icon(
      //         Icons.logout,
      //         size: 40,
      //         color: Color.fromARGB(200, 8, 65, 10),
      //       ),
      //       onPressed: () {
      //         signOut();
      //         Navigator.of(context).pushAndRemoveUntil(
      //           MaterialPageRoute(builder: (context) => MyApp()),
      //           (Route<dynamic> route) => false,
      //         );
      //       },
      //     ),
      //   ],
      // ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimension().screenContaintPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! Header
              SizedBox(
                height: 60,
                width: ScreenSize.width(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(
                              name: widget.logindetail.name!,
                              mobile: widget.logindetail.phonenumber!,
                              email: widget.logindetail.email!,
                              dob: widget.logindetail.dob!,
                              userId: widget.logindetail.uid!,
                            ),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColor.noProfileGrayColor,
                        radius: ScreenSize.height(context) <= 650 ? 20 : 25,
                        child: Icon(
                          Icons.person,
                          size: ScreenSize.height(context) <= 650 ? 25 : 30,
                          color: Color.fromARGB(200, 8, 65, 10),
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          signOut();
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => MyApp()),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: Icon(
                          Icons.logout,
                          size: ScreenSize.height(context) <= 650 ? 25 : 30,
                          color: Color.fromARGB(200, 8, 65, 10),
                        ))
                  ],
                ),
              ),

              SizedBox(
                height: ScreenSize.height(context) < 700 ? 13 : 15,
              ),
//!  welcome Greet

              BodyTittleText(
                tittle:
                    "${AppLocalizations.of(context)!.translate31} ${widget.logindetail.name}",
              ),

              SizedBox(
                height: ScreenSize.height(context) < 700 ? 110 : 120,
              ),

              Column(
                children: [
                  SubmitButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookAppointmentScreen(
                                docid: widget.logindetail.docid!),
                          ),
                        );
                      },
                      text: AppLocalizations.of(context)!.translate38,
                      textColor: AppColor.submitBtnTextWhite,
                      borderColor: AppColor.primaryBtnBorderColor),
                  const SizedBox(
                    height: 15,
                  ),
                  SubmitButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => BookedAppointsScreen(
                              userId: widget.logindetail.docid!)),
                        ),
                      );
                    },
                    text: AppLocalizations.of(context)!.translate40,
                    textColor: AppColor.submitBtnTextBlack,
                    backgroundColor: AppColor.backgroundColor,
                    borderColor: AppColor.blackBtnBorderColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
