import 'package:freezed_annotation/freezed_annotation.dart';

part 'invitation_response.freezed.dart';
part 'invitation_response.g.dart';

@freezed
class InvitationResponse with _$InvitationResponse {
  const factory InvitationResponse({
    required int peopleNum,
    required String invitationCode,
  }) = _InvitationResponse;

  factory InvitationResponse.fromJson(Map<String, Object?> json) => _$InvitationResponseFromJson(json);
}
