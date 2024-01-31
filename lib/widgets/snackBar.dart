import 'package:flutter/material.dart';

void snackBar(BuildContext context, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
