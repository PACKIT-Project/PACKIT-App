import 'package:get/get.dart';
import 'package:packit/presentation/main/controller/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
