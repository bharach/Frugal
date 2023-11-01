import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/color/app_colors.dart';
import '../../../constants/dimensions/app_dimensions.dart';
import '../../../constants/screen_size/app_screen_size.dart';
import '../../../widgets/app_button/back_button.dart';
import '../../../widgets/app_button/submit_button.dart';
import '../../../widgets/app_dropDown/app_dropdown.dart';
import '../../../widgets/app_text/app_text.dart';
import '../controller/book_an_appoint_controller.dart';

class BookAnAppointmentScreen extends StatelessWidget {
  BookAnAppointmentScreen({super.key});
  final BookAnAppointController controller = Get.put(BookAnAppointController());

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
                text: "Next",
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
                  tittle: 'Book an Appointment',
                  maxTextlines: 2,
                ),
                const SizedBox(
                  height: 30,
                ),
                BodySubTittleText(
                  tittle:
                      'Please select the hospital, doctor and type of appointment required for the patient.',
                  maxTextlines: 5,
                ),
                const SizedBox(
                  height: 25,
                ),
                const AppTiitleText(
                  tittle: "Health Facility",
                  fontweight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                 
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 05),
                  decoration: BoxDecoration(
                    color: AppColor.backgroundColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10.0,
                        spreadRadius: 0.5,
                        offset: const Offset(2, 05),
                        color:
                            const Color.fromRGBO(0, 0, 0, 1).withOpacity(0.1),
                      )
                    ],
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      offset: const Offset(0, -10),
                      iconEnabledColor: Colors.black,
                      iconOnClick: AnimatedBuilder(
                        animation: controller.animation,
                        builder: (context, child) {
                          return Image.asset(
                            "assets/icons/up_arrow.png",
                            width: 10,
                            height: 10,
                            color: Colors.black,
                          );
                        },
                      ),
                      isExpanded: true,
                      buttonDecoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                      ),
                      dropdownDecoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10.0,
                            spreadRadius: 0.5,
                            offset: const Offset(2, 05),
                            color: const Color.fromRGBO(0, 0, 0, 1)
                                .withOpacity(0.1),
                          )
                        ],
                      ),
                      icon: Image.asset(
                        "assets/icons/chevron.png",
                        width: 10,
                        height: 10,
                        color: Colors.black,
                      ),
                      items: controller.healthFaciltyList.map((list) {
                        return DropdownMenuItem(
                          value: list.toString(),
                          child: Text(
                            list.toString(),
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        controller.selectItem.value = value!;
                      },
                      hint: Obx(
                        () => Text(
                          controller.selectItem.value.toString(),
                          style: GoogleFonts.mulish(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const AppTiitleText(
                  tittle: "Doctor Specialty",
                  fontweight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.backgroundColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10.0,
                        spreadRadius: 0.5,
                        offset: const Offset(2, 05),
                        color:
                            const Color.fromRGBO(0, 0, 0, 1).withOpacity(0.1),
                        // Color.fromARGB(255, 141, 16, 16),
                      )
                    ],
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      offset: const Offset(0, -10),
                      iconEnabledColor: Colors.black,
                      iconOnClick: AnimatedBuilder(
                        animation: controller.animation,
                        builder: (context, child) {
                          return Image.asset(
                            "assets/icons/up_arrow.png",
                            width: 10,
                            height: 10,
                            color: Colors.black,
                          );
                        },
                      ),
                      isExpanded: true,
                      buttonDecoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                      ),
                      dropdownDecoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10.0,
                            spreadRadius: 0.5,
                            offset: const Offset(2, 05),
                            color: const Color.fromRGBO(0, 0, 0, 1)
                                .withOpacity(0.1),
                          )
                        ],
                      ),
                      icon: Image.asset(
                        "assets/icons/chevron.png",
                        width: 10,
                        height: 10,
                        color: Colors.black,
                      ),
                      items: controller.healthFaciltyList.map((list) {
                        return DropdownMenuItem(
                          value: list.toString(),
                          child: Text(
                            list.toString(),
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        controller.specialityItem.value = value!;
                      },
                      hint: Obx(
                        () => Text(
                          controller.specialityItem.value.toString(),
                          style: GoogleFonts.mulish(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    
  }
}
