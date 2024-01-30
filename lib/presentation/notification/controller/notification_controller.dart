import 'package:get/get.dart';
import 'package:packit/domain/enum/notification_type_enum.dart';

class NotificationController extends GetxController {
  final RxList<NotificationModel> notificationList = <NotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // notificationList.addAll([
    //   NotificationModel(
    //     type: NotificaionTypeEnum.remind,
    //     title: "졸업여행이 3일 남았습니다.",
    //     description: "여행 전까지 준비를 마무리하세요.",
    //     timestamp: DateTime.now(),
    //   ),
    //   NotificationModel(
    //     type: NotificaionTypeEnum.hurry,
    //     title: "hana님이 여행 준비를 재촉했습니다.",
    //     description: "남은 개인 준비 리스트를 완료해주세요!",
    //     timestamp: DateTime.now(),
    //   ),
    // ]);
  }
}

// Temporary model
class NotificationModel {
  final NotificaionTypeEnum type;
  final String title;
  final String description;
  final DateTime timestamp;

  NotificationModel({
    required this.type,
    required this.title,
    required this.description,
    required this.timestamp,
  });
}
