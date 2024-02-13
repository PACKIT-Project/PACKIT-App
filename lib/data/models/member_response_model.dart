import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_response_model.freezed.dart';
part 'member_response_model.g.dart';

@freezed
class MemberResponseModel with _$MemberResponseModel {
  const factory MemberResponseModel({
    required int id,
    required String nickname,
    required String profileImageUrl,
    required NotificationConfigStatusModel notificationConfigStatus,
  }) = _MemberResponseModel;

  factory MemberResponseModel.fromJson(Map<String, Object?> json) => _$MemberResponseModelFromJson(json);
}

@freezed
class NotificationConfigStatusModel with _$NotificationConfigStatusModel {
  const factory NotificationConfigStatusModel({
    required bool enableActiveNotification,
    required bool enableTravelRemindNotification,
  }) = _NotificationConfigStatusModel;

  factory NotificationConfigStatusModel.fromJson(Map<String, Object?> json) => _$NotificationConfigStatusModelFromJson(json);
}
