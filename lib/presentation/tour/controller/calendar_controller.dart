// ignore_for_file: unnecessary_cast

import 'package:get/get.dart';

class CalendarController extends GetxController {
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<DateTime?> rangeStart = (null as DateTime?).obs;
  Rx<DateTime?> rangeEnd = (null as DateTime?).obs;
  RxBool isTodayInRange = false.obs;
}
