import 'package:get/get.dart';
import 'package:paitentapp/screens/login_or_reg_screen/view/login_or_reg_screen.dart';
import '../screens/appointment_cancelled/view/appointment_cacelled.dart.dart';
import '../screens/appointment_confirmation/view/appointment_confirmed.dart';
import '../screens/appointment_details/view/appointment_details.dart';
import '../screens/book_an_appointment/view/book_an_appointment_screen.dart';
import '../screens/booked_appoints/view/booked_appoints_screen.dart';
import '../screens/cancel_appointment.dart/view/cancel_appointment.dart';
import '../screens/confrmApnBking/view/confrmApntmntBking_screen.dart';
import '../screens/login/view/login_screen.dart';
import '../screens/otp_screen/view/otp_screen.dart';
import '../screens/patient_details/view/patient_details_screen.dart';
import '../screens/register/view/register_screen.dart';
import '../screens/select_date/select_date_screen.dart';
import '../screens/select_time_slot/view/select_time_slot_screen.dart';
import '../screens/upcoming_appointment/view/upcoming_appointment.dart';
import '../screens/welcome_screen/view/welcome_screen.dart';

class Routes {
  static String loginOrRegisterScreen = "/LoginOrRegisterScreen";
  static String registerScreen = "/RegisterScreen";
  static String loginScreen = "/LoginScreen";
  static String oTPScreen = "/OTPScreen";
  static String welcomeScreen = "/WelcomeScreen";
  static String confrmApntmntBooking = "/ConfrmApntmntBooking";
  static String selectTimeSlotScreen = "/SelectTimeSlotScreen";
  static String selectDateScreen = "/SelectDateScreen";
  static String bookAnAppointmentScreen = "/BookAnAppointmentScreen";
  static String patientDetailsScreeen = "/PatientDetailsScreeen";
  static String appointmentConfirmationScreen =
      "/AppointmentConfirmationScreen";
  static String appointDetailsScreen = "/AppointDetailsScreen";
  static String cancelAppointmentScreen = "/CancelAppointmentScreen";
  static String appointmentCancelledScreen = "/AppointmentCancelledScreen";
  static String upcomingAppointmentScreen = "/UpcomingAppointmentScreen";
  static String bookedAppointsScreen = "/BookedAppointsScreen";
}

final getPages = [
  GetPage(
    name: Routes.loginOrRegisterScreen,
    page: () => const LoginOrRegisterScreen(),
  ),
  GetPage(
    name: Routes.registerScreen,
    page: () => const RegisterScreen(),
  ),
  GetPage(
    name: Routes.loginScreen,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: Routes.oTPScreen,
    page: () => const OTPScreen(),
  ),
  GetPage(
    name: Routes.welcomeScreen,
    page: () => const WelcomeScreen(),
  ),
  GetPage(
    name: Routes.confrmApntmntBooking,
    page: () => const ConfrmApntmntBooking(),
  ),
  GetPage(
    name: Routes.selectTimeSlotScreen,
    page: () => SelectTimeSlotScreen(),
  ),
  GetPage(
    name: Routes.selectDateScreen,
    page: () => const SelectDateScreen(),
  ),
  GetPage(
    name: Routes.bookAnAppointmentScreen,
    page: () => BookAnAppointmentScreen(),
  ),
  GetPage(
    name: Routes.patientDetailsScreeen,
    page: () => const PatientDetailsScreeen(),
  ),
  GetPage(
    name: Routes.appointmentConfirmationScreen,
    page: () => const AppointmentConfirmationScreen(),
  ),
  GetPage(
    name: Routes.appointDetailsScreen,
    page: () => const AppointDetailsScreen(),
  ),
  GetPage(
    name: Routes.confrmApntmntBooking,
    page: () => const CancelAppointmentScreen(),
  ),

  GetPage(
    name: Routes.appointmentCancelledScreen,
    page: () => const AppointmentCancelledScreen(),
  ),
  GetPage(
    name: Routes.upcomingAppointmentScreen,
    page: () => const UpcomingAppointmentScreen(),
  ),
  GetPage(
    name: Routes.bookAnAppointmentScreen,
    page: () => const BookedAppointsScreen(),
  ),
];
