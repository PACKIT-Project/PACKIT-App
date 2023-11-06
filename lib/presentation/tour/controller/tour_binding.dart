import 'package:get/get.dart';

import 'calendar_controller.dart';
import 'tour_controller.dart';

class TourBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TourController(), fenix: true);
    Get.lazyPut(() => CalendarController(), fenix: true);
  }
}
