import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constants/color/app_colors.dart';
import '../../../constants/dimensions/app_dimensions.dart';
import '../../../constants/screen_size/app_screen_size.dart';
import '../../../widgets/app_button/back_button.dart';
import '../../../widgets/app_button/submit_button.dart';
import '../../../widgets/app_text/app_text.dart';
import '../model/upcomingAppoints_model.dart';

class UpcomingAppointmentScreen extends StatelessWidget {
  const UpcomingAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const MainTittleText(
                tittle: 'Booked Appointments',
                maxTextlines: 2,
              ),
              const SizedBox(
                height: 15, //46
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const Divider(height: 15, color: Colors.transparent),

                  itemCount: upcomingAppointList.length,
                  itemBuilder: (context, index) {
                    var data = upcomingAppointList[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      // height: 315,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColor.detailsContainerBgColor,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(width: 0, color: Colors.transparent),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           BodyTittleText(
                            tittle: data.appointmenyTime.toString(),
                          ),
                          const SizedBox(height: 20),
                          bookedAppintFiledWidget(
                              tittle: "Location:",
                              desc: data.location.toString()),
                          const SizedBox(height: 20),
                          bookedAppintFiledWidget(
                              tittle: "Visited by:", desc: data.visitedBy.toString()),
                          const SizedBox(height: 20),
                          bookedAppintFiledWidget(
                              tittle: "Appointment for:",
                              desc: data.appointmentFor.toString()),
                          const SizedBox(height: 20),
                          Container(
                            // height: 30,
                            // alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(
                                left: 15, right: 30, top: 7, bottom: 7),

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: BodySubTittleText(
                              tittle: data.confirmationCode.toString(),
                              tittleColor: AppColor.bodytitleTextColorBlack,
                              maxTextlines: 2,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bookedAppintFiledWidget({required tittle, required String desc}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTittleText(
          tittle: tittle,
          textSize: 12,
          tittleColor: const Color(0xff666666),
          textWeight: FontWeight.w800,
        ),
        const SizedBox(
          height: 03,
        ),
        BodySubTittleText(
          tittle: desc,
        )
      ],
    );
  }
}
