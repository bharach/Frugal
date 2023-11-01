import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookAnAppointController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxList healthFaciltyList = ["facility1", "faciity2", "faciilty3"].obs;
  RxList doctorSpecialtyList =
      ["General Physician", "speciality1", "fspeciality2"].obs;
  RxString selectItem = "Select".obs;
  RxString specialityItem = "Select Speciality".obs;

  RxDouble rotationAngle = 0.0.obs;

  late AnimationController controller;
  late Animation<double> animation;


  @override
  void onInit() {
   controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    super.onInit();
  }

  void rotatIcoon() {
      rotationAngle.value += 90; // Rotate by 90 degrees on each tap
  }
}
