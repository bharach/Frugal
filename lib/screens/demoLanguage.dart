import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemoLanguageScreen extends StatefulWidget {
  const DemoLanguageScreen({super.key});

  @override
  State<DemoLanguageScreen> createState() => _DemoLanguageScreenState();
}

class _DemoLanguageScreenState extends State<DemoLanguageScreen> {
  String name = "Subrat";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Multi Language".tr),
      ),
      body: 
      
       Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("Hello".tr)
            // Add the following code
            // Localizations.override(
            //   context: context,
            //   locale: const Locale('fr '),
            //   // Using a Builder to get the correct BuildContext.
            //   // Alternatively, you can create a new widget and Localizations.override
            //   // will pass the updated BuildContext to the new widget.
            //   child: Builder(
            //     builder: (context) {
            //       // A toy example for an internationalized Material widget.
            //       return Text(" I Love you");
                  
            //       // CalendarDatePicker(
            //       //   initialDate: DateTime.now(),
            //       //   firstDate: DateTime(1900),
            //       //   lastDate: DateTime(2100),
            //       //   onDateChanged: (value) {},
            //       // );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );

    // Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       ListTile(
    //         titleAlignment: ListTileTitleAlignment.center,
    //         title: Text('message'.tr),
    //         subtitle: Text('name'.tr),
    //       ),
    //       const SizedBox(
    //         height: 50,
    //       ),
    //       ListTile(
    //         titleAlignment: ListTileTitleAlignment.center,
    //         title: Text(name.tr),
    //         subtitle: Text('name'.tr),
    //       ),
    //       const SizedBox(
    //         height: 50,
    //       ),
    //       Row(
    //         children: [
    //           OutlinedButton(onPressed: () {
    //             Get.updateLocale(Locale('en' ,'US'));
    //           }, child: const Text("English")),
    //           const SizedBox(
    //             width: 20,
    //           ),
    //           OutlinedButton(onPressed: () {
    //             setState(() {
    //               name = "Kiran";
    //             });
    //             Get.updateLocale(Locale('ur' ,'PK'));
    //           }, child: const Text("Urdu")),
    //         ],
    //       )
    //     ],
    //   ),
    // ),
  }
}
