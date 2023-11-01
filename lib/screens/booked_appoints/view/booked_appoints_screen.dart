import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/color/app_colors.dart';
import '../../../constants/dimensions/app_dimensions.dart';
import '../../../widgets/app_button/back_button.dart';
import '../../../widgets/app_button/submit_button.dart';

class BookedAppointsScreen extends StatelessWidget {
  const BookedAppointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.screenBgColor,
      bottomNavigationBar: SizedBox(
        height: 55,
        child:SizedBox(
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
                text: "Home",
                textColor: AppColor.submitBtnTextWhite,
                borderColor: AppColor.primaryBtnBorderColor),
          ),
        ),
      ),

      body: SafeArea(
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

              const Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [],
                 
                 
                  ),
                ),
              ),
           
           
            ],
          ),
        ),
      ),
    );
 
  }
}