import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:patientapp/screens/login/loginscreen.dart';
import 'package:patientapp/screens/registration/registerscreen.dart';
import '../../../widgets/app_button/submit_button.dart';
import '../../../widgets/app_text/app_text.dart';
import '../../constants/color/app_colors.dart';
import '../../constants/dimensions/app_dimensions.dart';
import '../../constants/screen_size/app_screen_size.dart';

class LoginOrRegisterScreen extends StatelessWidget {
  const LoginOrRegisterScreen({super.key});

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
                    tittle: AppLocalizations.of(context)!.translate0,
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
                  SubmitButton(
                      onTap: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                      },
                      text: AppLocalizations.of(context)!.translate1,
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
                            builder: (context) => const RegisterScreen()));
                    },
                    text: AppLocalizations.of(context)!.translate2,
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
