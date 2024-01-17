import 'package:freezed_annotation/freezed_annotation.dart';

import '../enum/member_status_enum.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required String message,
    required String timestamp,
    required Data data,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, Object?> json) => _$LoginResponseFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    required MemberStatusEnum memberStatus,
    required String accessToken,
    required String refreshToken,
  }) = _Data;

  factory Data.fromJson(Map<String, Object?> json) => _$DataFromJson(json);
}
