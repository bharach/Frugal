import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/color/app_colors.dart';
import '../../../constants/dimensions/app_dimensions.dart';
import '../../../constants/screen_size/app_screen_size.dart';
import '../../../widgets/app_button/back_button.dart';
import '../../../widgets/app_button/submit_button.dart';
import '../../../widgets/app_text/app_text.dart';
import '../../../widgets/app_textfield/app_textfield.dart';

class PatientDetailsScreeen extends StatelessWidget {
  const PatientDetailsScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    
    Scaffold(
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
                  //   Get.to(const WelcomeScreen(),
                  //   transition: Transition.fadeIn,
                  //       curve: Curves.easeOut,
                  //       duration: const Duration(milliseconds: 400),
                  // );
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
                  height: 10.h,
                ),
                AppBackButton(
                  onTap: () {
                    Get.back();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                const MainTittleText(
                  tittle: 'Patient Details',
                  maxTextlines: 2,
                ),
                const SizedBox(
                  height: 30,
                ),
                BodySubTittleText(
                  tittle:
                      'Please Fill in the following Patient details, along with the accessible Phone number for this specific Appointment.',
                  maxTextlines: 5,
                ),
                const SizedBox(
                  height: 25,
                ),
                DetailsTextField(
                  hint: "Patient Full Name",
                  onTextChanged: (_) {},
                  onValidator: (_) {
                    return null;
                  },
                  inputType: TextInputType.name,
                  secureText: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                 DetailsTextField(
                  hint: "Date of Birth (DD-MM-YYYY)",
                  onTextChanged: (_) {},
                  onValidator: (_) {
                    return null;
                  },
                  inputType: TextInputType.name,
                  secureText: false,
                ),
                 const SizedBox(
                  height: 20,
                ),
                 DetailsTextField(
                  hint: "Phone number for the Appointment",
                  onTextChanged: (_) {},
                  onValidator: (_) {
                    return null;
                  },
                  inputType: TextInputType.name,
                  secureText: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  
  
  
  }
}


