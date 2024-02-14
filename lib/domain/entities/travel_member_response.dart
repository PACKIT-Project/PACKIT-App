import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_member_response.freezed.dart';
part 'travel_member_response.g.dart';

@freezed
class TravelMemberResponse with _$TravelMemberResponse {
  const factory TravelMemberResponse({
    required int memberId,
    required String nickName,
    required String profileImg,
    required int checkedNum,
    required int unCheckedNum,
  }) = _TravelMemberResponse;

  factory TravelMemberResponse.fromJson(Map<String, Object?> json) => _$TravelMemberResponseFromJson(json);
}
