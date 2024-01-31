import 'package:flutter/material.dart';

class AppointmentData {
  String _hospitalId = '';
  String _hospitalName = '';
  String _doctorId = '';
  String _doctorName = '';
  String _doctorSpec = '';
  DateTime _date = DateTime.now();
  DateTime _appointmentTime = DateTime.now();
  String _patientName = '';
  String _patientDOB = '';
  String _patientEmail = '';
  String _phoneNumber = '';
  String _address = '';
  String _confirmationCode = '';
  String _userId = '';
  bool _checkedIn = false;

  // Add other necessary fields

  // Getters
  String get hospitalId => _hospitalId;
  String get hospitalName => _hospitalName;
  String get doctorId => _doctorId;
  String get doctorName => _doctorName;
  String get doctorSpec => _doctorSpec;
  DateTime get date => _date;
  DateTime get appointmentTime => _appointmentTime;
  String get patientName => _patientName;
  String get patientDOB => _patientDOB;
  String get phoneNumber => _phoneNumber;
  String get address => _address;
  String get confirmationCode => _confirmationCode;
  String get userId => _userId;
  String get patienemail => _patientEmail;
  bool get checkedIn => _checkedIn;
  // Add getters for other fields

  // Setters
  set hospitalId(String value) {
    _hospitalId = value;
  }

  set hospitalName(String value) {
    _hospitalName = value;
  }

  set doctorId(String value) {
    _doctorId = value;
  }

  set doctorName(String value) {
    _doctorName = value;
  }

  set doctorSpec(String value) {
    _doctorSpec = value;
  }

  set date(DateTime value) {
    _date = value;
  }

  set appointmentTime(DateTime value) {
    _appointmentTime = value;
  }

  set patientName(String value) {
    _patientName = value;
  }

  set patientDOB(String value) {
    _patientDOB = value;
  }

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  set patientEmail(String value) {
    _patientEmail = value;
  }

  set address(String value) {
    _address = value;
  }

  set confirmationCode(String value) {
    _confirmationCode = value;
  }

  set userId(String value) {
    _userId = value;
  }

  set checkedIn(bool value) {
    _checkedIn = value;
  }

  Map<String, dynamic> toJson() => {
        'checkedIn': _checkedIn,
        'address': _address,
        'confirmationCode': _confirmationCode,
        'userId': _userId,
        'phone Number': _phoneNumber,
        'dob': _patientDOB,
        'name': _patientName,
        'email': _patientEmail,
        'Day': _date,
        'DoctorID': _doctorId,
        'DoctorSpeciality': _doctorSpec,
        'HospitalName': _hospitalName,
        'TimeUnit': {
          'AptStarttime': _appointmentTime,
        }
      };
}
