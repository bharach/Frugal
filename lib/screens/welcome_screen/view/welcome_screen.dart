import 'package:flutter/material.dart';
import 'package:paitentapp/constants/dimensions/app_dimensions.dart';
import 'package:paitentapp/constants/screen_size/app_screen_size.dart';

import '../../../constants/color/app_colors.dart';
import '../../../widgets/app_button/submit_button.dart';
import '../../../widgets/app_text/app_text.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenBgColor,
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColor.noProfileGrayColor,
                      radius: 30,
                    ),
                    Image(
                        image: AssetImage(
                          "assets/icons/noti.png",
                        ),
                        color: AppColor.appIconColor,
                        height: 25,
                        width: 25)
                  ],
                ),
              ),

              SizedBox(
                height: ScreenSize.height(context) < 700 ? 13 : 15,
              ),
              //!  welcome Greet

                const BodyTittleText(
                tittle: "Welcome, John",

              ),

               SizedBox(
                height: ScreenSize.height(context) < 700 ? 110 : 120,
              ),
             Column(
                children: [
                  SubmitButton(
                      onTap: () {
                        // Get.to(
                        //   // '/LoginScreen',
                        //   const LoginScreen(),
                        //   transition: Transition.rightToLeft,
                        //   curve: Curves.easeOut,
                        //   duration: const Duration(milliseconds: 300),
                        // );
                      },
                      text: "Book an Appointment",
                      textColor: AppColor.submitBtnTextWhite,
                      borderColor: AppColor.primaryBtnBorderColor),
                  const SizedBox(
                    height: 15,
                  ),
                  SubmitButton(
                    onTap: () {
                      // Get.to(
                      //     // '/RegisterScreen',
                      //     const RegisterScreen(),
                      //     transition: Transition.rightToLeft,
                      //     curve: Curves.easeOut,
                      //     duration: const Duration(milliseconds: 300),
                      //   );
                    },
                    text: "Booked Appointments",
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
