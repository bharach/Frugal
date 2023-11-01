import 'package:flutter/material.dart';

import '../app_text/app_text.dart';


class AppAlertDialog extends StatelessWidget {
  final String title;
  final String description;
  final List<Widget>? actionss;

  const AppAlertDialog(
      {super.key, required this.title, required this.description, this.actionss});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        // <-- SEE HERE
        title: BodySubTittleText(
            tittle: title,
            tittleColor: Colors.black,
            textSize: 18,
            fontweight: FontWeight.w700),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              DescriptionText(
                tittle: description,
                textsize: 16,
                tittleColor: Colors.black87,
              )
            ],
          ),
        ),
        actions: actionss);
  }
}