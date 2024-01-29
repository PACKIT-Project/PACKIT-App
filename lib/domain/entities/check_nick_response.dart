import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_nick_response.freezed.dart';
part 'check_nick_response.g.dart';

@freezed
class CheckNickResponse with _$CheckNickResponse {
  const factory CheckNickResponse({
    required bool isDuplicated,
  }) = _CheckNickResponse;

  factory CheckNickResponse.fromJson(Map<String, Object?> json) => _$CheckNickResponseFromJson(json);
}
