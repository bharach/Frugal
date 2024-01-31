import 'package:patientapp/Models/logindetail.dart';

class AppointmentBlockModel {
  final Logindetail detail;
  final String? doctorid;
  final String? doctorspeciality;
  final String? hospitalname;
  final DateTime? aptEndtime;
  final DateTime? aptStarttime;
  final DateTime? dayId;
  final DateTime? weekId;
  final bool checkedIn;
  final String? confcode;
  final String? userID;
  final DateTime? day;

  const AppointmentBlockModel(
      {required this.detail,
      required this.checkedIn,
      required this.doctorid,
      required this.doctorspeciality,
      required this.hospitalname,
      required this.aptEndtime,
      required this.aptStarttime,
      required this.dayId,
      required this.weekId,
      required this.confcode,
      required this.userID,
      required this.day});

  Map<String, dynamic> toJson() => {
        'Booking': {
          'checkedIn': checkedIn,
          'confirmationCode': confcode,
          'userId': userID,
          'Patientdate': {
            'phone Number': detail.phonenumber,
            'dob': detail.dob,
            'name': detail.name,
            'email': detail.email,
          },
        },
        'Day': day,
        'DoctorID': doctorid,
        'DoctorSpeciality': doctorspeciality,
        'HospitalName': hospitalname,
        'TimeUnit': {
          'AptEndtime': aptEndtime?.toUtc(),
          'AptStarttime': aptStarttime?.toUtc(),
          'DayId': dayId?.toUtc(),
          'WeekId': weekId?.toUtc(),
        }
      };
}
