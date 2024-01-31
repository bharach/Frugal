import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/color/app_colors.dart';
import '../../constants/dimensions/app_dimensions.dart';
import '../../constants/screen_size/app_screen_size.dart';
import '../../main.dart';
import '../../widgets/app_button/submit_button.dart';
import '../homepage.dart';
import '../login_or_reg_screen/login_or_reg_screen.dart';

class LanguageSelection extends StatefulWidget {
  const LanguageSelection({super.key});

  @override
  State<LanguageSelection> createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  void set_Language(BuildContext context, String languageCode) async {
    Locale mylocale = Locale(languageCode, languageCode);
    MyApp.of(context)?.setLocale(mylocale);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', languageCode);
    Navigator.push(
        // context, MaterialPageRoute(builder: (context) => const HomePage()));
        context, MaterialPageRoute(builder: (context) => const LoginOrRegisterScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    height: ScreenSize.height(context) * 0.45,
                    width: ScreenSize.height(context) * 0.45,
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                   SubmitButton(
                      onTap: () {
                       set_Language(context, 'en');
                      },
                      text: "English",
                      textColor: AppColor.submitBtnTextWhite,
                      borderColor: AppColor.primaryBtnBorderColor),
              
               const SizedBox(
                    height: 15,
                  ),

                   SubmitButton(
                      onTap: () {
                  set_Language(context, 'fr');
                      },
                      text: "French",
                      textColor: AppColor.submitBtnTextWhite,
                      borderColor: AppColor.primaryBtnBorderColor),
              
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

