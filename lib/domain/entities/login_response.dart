import 'package:freezed_annotation/freezed_annotation.dart';

import '../enum/member_status_enum.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required String message,
    required String timestamp,
    required LoginData data,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, Object?> json) => _$LoginResponseFromJson(json);
}

@freezed
class LoginData with _$LoginData {
  const factory LoginData({
    required MemberStatusEnum memberStatus,
    required String accessToken,
    required String refreshToken,
  }) = _LoginData;

  factory LoginData.fromJson(Map<String, Object?> json) => _$LoginDataFromJson(json);
}
