import 'package:flutter/material.dart';

class Logindetail {
  final String? docid;
  final String? phonenumber;
  final String? name;
  final String? dob;
  final String? email;
  final String? uid;

  const Logindetail(
      {required this.phonenumber,
      required this.name,
      required this.dob,
      required this.email,
      required this.uid,
      required this.docid});

  Map<String, dynamic> toJson() => {
        "phoneNumber": phonenumber,
        "name": name,
        "dob": dob,
        "email": email,
        "uid": uid
      };
}
