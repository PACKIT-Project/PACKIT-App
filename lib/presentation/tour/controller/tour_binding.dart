import 'package:get/get.dart';

import 'calendar_controller.dart';

class TourBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CalendarController());
  }
}
