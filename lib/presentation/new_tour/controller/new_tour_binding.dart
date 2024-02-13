import 'package:get/get.dart';

import 'calendar_controller.dart';
import 'new_tour_controller.dart';

class NewTourBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewTourController(), fenix: true);
    Get.lazyPut(() => CalendarController(), fenix: true);
  }
}
