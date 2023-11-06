import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paitentapp/constants/color/app_colors.dart';
import 'package:paitentapp/constants/dimensions/app_dimensions.dart';
import 'package:paitentapp/constants/screen_size/app_screen_size.dart';
import 'package:paitentapp/generated/locale_keys.g.dart';
import 'package:paitentapp/screens/login/view/login_screen.dart';
import 'package:paitentapp/screens/register/view/register_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../widgets/app_button/submit_button.dart';
import '../../../widgets/app_text/app_text.dart';

class LoginOrRegisterScreen extends StatefulWidget {
  const LoginOrRegisterScreen({super.key});

  @override
  State<LoginOrRegisterScreen> createState() => _LoginOrRegisterScreenState();
}

class _LoginOrRegisterScreenState extends State<LoginOrRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return
    
     Scaffold(
      backgroundColor: AppColor.screenBgColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 200.0),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/sayap.png",
                    filterQuality: FilterQuality.high,
                    height: ScreenSize.height(context) * 0.25,
                    width: ScreenSize.height(context) * 0.25,
                  ),
                   AppTiitleText(
                    tittle: "app_title",
                  ),

                
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppDimension().subMitBtnPadding),
              child: 
              Column(
                children: [

                  // Text(LocaleKeys.app_title).tr(),
                  // Text("register",).tr(),


                  // Text("hello_world").tr(),
           
                  SubmitButton(
                      onTap: () {
                        Get.to(
                          // '/LoginScreen',
                          const LoginScreen(),
                          transition: Transition.rightToLeft,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 300),
                        );
                      },
                      text: "login",
                      textColor: AppColor.submitBtnTextWhite,
                      borderColor: AppColor.primaryBtnBorderColor),
                  const SizedBox(
                    height: 15,
                  ),
                  SubmitButton(
                    onTap: () {
                      Get.to(
                          // '/RegisterScreen',
                          const RegisterScreen(),
                          transition: Transition.rightToLeft,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 300),
                        );
                    },
                    text: "register",
                    textColor: AppColor.submitBtnTextBlack,
                    backgroundColor: AppColor.backgroundColor,
                    borderColor: AppColor.blackBtnBorderColor,
                  ),
                ],
              ),
         
            ),
          )
        ],
      ),
    );
 
 
 
  }
}
