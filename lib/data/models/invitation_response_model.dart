import 'package:freezed_annotation/freezed_annotation.dart';

part 'invitation_response_model.freezed.dart';
part 'invitation_response_model.g.dart';

@freezed
class InvitationResponseModel with _$InvitationResponseModel {
  const factory InvitationResponseModel({
    required int peopleNum,
    required String invitationCode,
  }) = _InvitationResponseModel;

  factory InvitationResponseModel.fromJson(Map<String, Object?> json) => _$InvitationResponseModelFromJson(json);
}
