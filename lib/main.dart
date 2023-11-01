import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paitentapp/routes/app_routes.dart';
import 'package:paitentapp/screens/book_an_appointment/view/book_an_appointment_screen.dart';
import 'package:paitentapp/screens/confrmApnBking/view/confrmApntmntBking_screen.dart';
import 'package:paitentapp/screens/select_date/select_date_screen.dart';
import 'package:paitentapp/screens/select_time_slot/view/select_time_slot_screen.dart';

import 'screens/appointment_cancelled/view/appointment_cacelled.dart.dart';
import 'screens/appointment_confirmation/view/appointment_confirmed.dart';
import 'screens/appointment_details/view/appointment_details.dart';
import 'screens/booked_appoints/view/booked_appoints_screen.dart';
import 'screens/cancel_appointment.dart/view/cancel_appointment.dart';
import 'screens/login_or_reg_screen/view/login_or_reg_screen.dart';
import 'screens/patient_details/view/patient_details_screen.dart';
import 'screens/upcoming_appointment/view/upcoming_appointment.dart';
import 'widgets/app_text/app_text.dart';

void main() {
  // runApp(const MyApp());

//! with Device preview

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return GetMaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   home: Container()
    // );

    //! with device preview
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            theme: ThemeData.light(),
            // getPages: getPages,
            // initialRoute: '/selectTimeSlotScreen',
          
            // home: const PatientDetailsScreeen()
            // home: const BookedAppointsScreen()
            // home: const AppointmentConfirmationScreen()
            // home: const AppointDetailsScreen()
            home: const UpcomingAppointmentScreen()
            // home: const CancelAppointmentScreen()
            // home: const AppointmentCancelledScreen()

            // home:const  LoginOrRegisterScreen()
            );
      },
    );
  }

 
}
