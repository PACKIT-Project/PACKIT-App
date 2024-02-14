import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_member_response_model.freezed.dart';
part 'travel_member_response_model.g.dart';

@freezed
class TravelMemberResponseModel with _$TravelMemberResponseModel {
  const factory TravelMemberResponseModel({
    required int memberId,
    required String nickName,
    required String profileImg,
    required int checkedNum,
    required int unCheckedNum,
  }) = _TravelMemberResponseModel;

  factory TravelMemberResponseModel.fromJson(Map<String, Object?> json) => _$TravelMemberResponseModelFromJson(json);
}
