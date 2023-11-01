import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paitentapp/screens/appointment_confirmation/view/appointment_confirmed.dart';
import 'package:paitentapp/screens/confrmApnBking/view/confrmApntmntBking_screen.dart';

import '../../../constants/color/app_colors.dart';
import '../../../constants/dimensions/app_dimensions.dart';
import '../../../constants/screen_size/app_screen_size.dart';
import '../../../widgets/app_button/back_button.dart';
import '../../../widgets/app_button/submit_button.dart';
import '../../../widgets/app_text/app_text.dart';
import '../controller/time_slot_controller.dart';

class SelectTimeSlotScreen extends StatelessWidget {
  SelectTimeSlotScreen({super.key});
  final TimeslotController controller = Get.put(TimeslotController());

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
                  Get.to(
                    const ConfrmApntmntBooking(),
                    transition: Transition.fadeIn,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 400),
                  );
                },
                text: "Next",
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
                tittle: 'Select Time Slot',
                maxTextlines: 2,
              ),
              const SizedBox(
                height: 30,
              ),
              BodySubTittleText(
                tittle:
                    'Please select one of the available time slot for the appointment.',
                maxTextlines: 5,
              ),
              const SizedBox(
                height: 30,
              ),

              //!TIme Slots List
              Expanded(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 25,
                      crossAxisSpacing: 30,
                      childAspectRatio: 3),
                  itemCount: controller.timeSlotArrray.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // controller.selectedIndex.value = index;
                        controller.selectedGridItem(index);
                      },
                      child: Obx(
                        () => Container(
                          width: ScreenSize.width(context) / 3,
                          alignment: Alignment.center,
                          // padding: const EdgeInsets.symmetric(
                          //     horizontal: 20, vertical: 12), //24 , 14
                          decoration: BoxDecoration(
                            color: controller.selectedIndex.value == index
                                ? AppColor.selectTiemeSlotBtnColor
                                : AppColor.unselectTiemeSlotBtnColor,
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: TImeSlotText(
                            tittle: controller.timeSlotArrray[index],
                            tittleColor: controller.selectedIndex.value == index
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
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
}
