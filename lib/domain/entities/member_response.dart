import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_response.freezed.dart';
part 'member_response.g.dart';

@freezed
class MemberResponse with _$MemberResponse {
  const factory MemberResponse({
    required int id,
    required String nickname,
    required String profileImageUrl,
    required NotificationConfigStatus notificationConfigStatus,
  }) = _MemberResponse;

  factory MemberResponse.fromJson(Map<String, Object?> json) => _$MemberResponseFromJson(json);
}

@freezed
class NotificationConfigStatus with _$NotificationConfigStatus {
  const factory NotificationConfigStatus({
    required bool enableActiveNotification,
    required bool enableTravelRemindNotification,
  }) = _NotificationConfigStatus;

  factory NotificationConfigStatus.fromJson(Map<String, Object?> json) => _$NotificationConfigStatusFromJson(json);
}
