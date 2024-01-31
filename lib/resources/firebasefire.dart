import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:patientapp/Models/appointment.dart';
import 'package:patientapp/Models/logindetail.dart';
import 'package:uuid/uuid.dart';
import 'package:patientapp/screens/dashboard/dashboard.dart';
import 'package:patientapp/Models/patientdetail.dart';

class FirestoreMethods {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

//Check if the user is already registered or check if the user login not present
  Future<bool> checkUser({required String phonenumber}) async {
    bool check = false;
    try {
      var user = await _firestore
          .collection('users')
          .where('phoneNumber', isEqualTo: phonenumber)
          .get();

      if (user.docs.isNotEmpty) {
        check = true;
      }
    } catch (e) {
      print(e);
    }

    return check;
  }

  Future<Logindetail> signUp(
      {required String name,
      required String dob,
      required String email,
      required String mmid,
      required String phonenumber}) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    //String postId = Uuid().v1();

    Logindetail post = Logindetail(
        docid: Uuid().v1(),
        phonenumber: phonenumber,
        name: name,
        dob: dob,
        email: email,
        uid: mmid);

    try {
      await _firestore.collection('users').doc(post.docid).set(post.toJson());
    } catch (error) {
      print(error);
    }
    return post;
  }

  Future<AppointmentData?> addAppoint({required AppointmentData data}) async {
    try {
      await _firestore
          .collection('users')
          .doc(data.userId)
          .collection('Appointments')
          .doc(Uuid().v4())
          .set(data.toJson());
      /*
      await _firestore
          .collection('Hospitals')
          .doc(data.hospitalId)
          .collection('Appointments')
          .doc(Uuid().v4())
          .set(data.toJson());
          */
      return data;
    } catch (error) {
      return null;
    }
  }

  Future<List<AppointmentData>?> getAppoint({required String userId}) async {
    log(userId.toString());

    List<AppointmentData> appoints = [];
    try {
      var doc = await _firestore
          .collection('users')
          .doc(userId)
          .collection('Appointments')
          .get();
      if (doc.docs.isNotEmpty) {
        for (int i = 0; i < doc.docs.length; i++) {
          AppointmentData appointment = AppointmentData();
          appointment.hospitalName = doc.docs[i].data()['HospitalName'];
          appointment.doctorId = doc.docs[i].data()['DoctorID'];
          //appointment.doctorName = doc.docs[i].data()['DoctorName'];
          appointment.doctorSpec = doc.docs[i].data()['DoctorSpeciality'];
          appointment.date =
              ((doc.docs[i].data()['Day']) as Timestamp).toDate();
          appointment.appointmentTime =
              (doc.docs[i].data()['TimeUnit']['AptStarttime'] as Timestamp)
                  .toDate();
          appointment.patientName = doc.docs[i].data()['name'];
          appointment.patientDOB = doc.docs[i].data()['dob'];
          appointment.phoneNumber = doc.docs[i].data()['phone Number'];
          appointment.patientEmail = doc.docs[i].data()['email'];
          appointment.address = doc.docs[i].data()['address'];
          appointment.confirmationCode = doc.docs[i].data()['confirmationCode'];
          appointment.userId = doc.docs[i].data()['userId'];
          appointment.checkedIn = doc.docs[i].data()['checkedIn'];
          appoints.add(appointment);
        }
        return appoints;
      }
    } catch (error) {
      print(error);
    }
    return null;
  }
}
