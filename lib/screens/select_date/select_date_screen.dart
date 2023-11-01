import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paitentapp/screens/select_time_slot/view/select_time_slot_screen.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../constants/color/app_colors.dart';
import '../../constants/dimensions/app_dimensions.dart';
import '../../constants/screen_size/app_screen_size.dart';
import '../../widgets/app_button/back_button.dart';
import '../../widgets/app_button/submit_button.dart';
import '../../widgets/app_text/app_text.dart';

class SelectDateScreen extends StatelessWidget {
  const SelectDateScreen({super.key});

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
                    SelectTimeSlotScreen(),
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
                  tittle: 'Select Date',
                  maxTextlines: 2,
                ),
                const SizedBox(
                  height: 30,
                ),
                BodySubTittleText(
                  tittle: 'Please select the date of the appointment.',
                  maxTextlines: 5,
                ),
                const SizedBox(
                  height: 30,
                ),

                //! Calender
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    shadowColor:
                        const Color.fromRGBO(0, 0, 0, 1).withOpacity(0.4),
                    elevation: 05,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: DateTime.now(),
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: GoogleFonts.urbanist(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColor.weekDaysColor,
                        ),
                        weekendStyle: GoogleFonts.urbanist(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColor.weekDaysColor,
                        ),
                      ),
                      headerStyle: HeaderStyle(
                        titleCentered: true,
                        titleTextStyle: GoogleFonts.urbanist(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColor.calenderTextColor,
                        ),
                        decoration: BoxDecoration(
                            // color: AppColor.primaryColor,

                            borderRadius: BorderRadius.circular(8.0)),
                        formatButtonTextStyle: TextStyle(
                            color: AppColor.primaryColor, fontSize: 16.0),
                        formatButtonDecoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        leftChevronIcon: const Icon(
                          Icons.chevron_left,
                          color: AppColor.leftChevronIconColor,
                          size: 16,
                        ),
                        rightChevronIcon: const Icon(
                          Icons.chevron_right,
                          color: AppColor.righttChevronIconColor,
                          size: 16,
                        ),
                      ),
                      headerVisible: true,
                      availableCalendarFormats: const {
                        CalendarFormat.month: 'Month'
                      },
                      calendarStyle: CalendarStyle(
                        defaultTextStyle: GoogleFonts.urbanist(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColor.calenderTextColor,
                        ),
                        weekendTextStyle: GoogleFonts.urbanist(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColor.calenderTextColor,
                        ),
                        todayDecoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: const BoxDecoration(
                          color: AppColor.calenderTextColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
