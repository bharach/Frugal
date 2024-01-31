import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patientapp/Models/patientdetail.dart';
import 'package:patientapp/screens/dashboard/appointmentavailability.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants/color/app_colors.dart';
import '../../constants/dimensions/app_dimensions.dart';
import '../../constants/screen_size/app_screen_size.dart';
import '../../widgets/app_button/back_button.dart';
import '../../widgets/app_button/submit_button.dart';
import '../../widgets/app_text/app_text.dart';

class CalenderScreen extends StatefulWidget {
  final AppointmentData data;
  const CalenderScreen({required this.data});

  @override
  State<CalenderScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CalenderScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  DateTime today = DateTime.now();
  String? language = 'en_US';

  void getlocale() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final String? lang = pref.getString('language');
      print(lang);
      if (lang == 'fr') {
        language = 'fr_FR';
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getlocale();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  widget.data.date = _selectedDay!;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AppointmentAvail(data: widget.data)));
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
                  height: 10,
                ),
                Row(
                  children: [
                    AppBackButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    // SizedBox(
                    //   width: 40,
                    // ),
                    // Text(
                    //   widget.data.hospitalName,
                    //   style: TextStyle(fontSize: 15,fontWeight: Font), //40
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const MainTittleText(
                  tittle: 'Select Date',
                  maxTextlines: 2,
                ),
                const SizedBox(
                  height: 15,
                ),
                BodySubTittleText(
                  tittle: 'Please select the date of the appointment.',
                  maxTextlines: 5,
                ),
                const SizedBox(
                  height: 05,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TableCalendar(
                    firstDay: DateTime.utc(today.year, today.month, today.day),
                    lastDay: DateTime.now().add(const Duration(days: 60)),
                    locale: language,
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: GoogleFonts.urbanist(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColor.weekDaysColor,
                      ),
                      weekendStyle: GoogleFonts.urbanist(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColor.weekDaysColor,
                      ),
                    ),
                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      titleTextStyle: GoogleFonts.urbanist(
                        fontSize: 15,
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
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColor.calenderTextColor,
                      ),
                      weekendTextStyle: GoogleFonts.urbanist(
                        fontSize: 15,
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
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onHeaderTapped: (focusedDay) {},
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        print(selectedDay);

                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                    calendarBuilders: const CalendarBuilders(),
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
