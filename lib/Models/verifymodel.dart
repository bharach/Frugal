import 'package:flutter/material.dart';

class VerifyModel {
  final bool status;
  final String message;
  final String verificationId;

  const VerifyModel(
      {required this.status,
      required this.message,
      required this.verificationId});
}
