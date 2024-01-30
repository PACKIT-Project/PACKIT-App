import 'package:get/get.dart';
import 'package:packit/presentation/notification/controller/notification_controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController(), fenix: true);
  }
}
