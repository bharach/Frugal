import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool enabled;

  CustomInputField(
      {required this.labelText,
      required this.controller,
      required this.enabled});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:
          MediaQuery.of(context).size.width * 0.85, // Width in logical pixels
      height: 56, // Height in logical pixels
      decoration: BoxDecoration(
        color: Color(0xFFEDF5F4), // Background color
        borderRadius: BorderRadius.circular(8), // Rounded corners
        border: Border.all(
          color: Color(0xFFE8ECF4), // Border color
          width: 1, // Border width
        ),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText, // Custom label text
          enabled: enabled,
          border: InputBorder.none, // Remove the default input border
          contentPadding: EdgeInsets.symmetric(
              vertical: 15, horizontal: 16), // Text padding
        ),
      ),
    );
  }
}
