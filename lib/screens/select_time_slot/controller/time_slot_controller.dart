import 'package:get/get.dart';

class TimeslotController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxList<String> timeSlotArrray =
      ['09 h 00', '09 h 30', '10 h 00', '11 h 00', '11 h 30', '12 h 30'].obs;

  // RxInt? selectedIndex = RxInt(0);

  void selectedGridItem(int itemindex) {
selectedIndex.value = itemindex;
    timeSlotArrray.refresh();
  }
}
