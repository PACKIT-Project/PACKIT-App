import 'package:get/get.dart';
import 'package:packit/presentation/main/controller/main_controller.dart';
import 'package:packit/presentation/main/controller/tour_controller.dart';
import 'package:packit/presentation/profile/controller/profile_tab_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(TourController());
    Get.put(ProfileController());
  }
}
