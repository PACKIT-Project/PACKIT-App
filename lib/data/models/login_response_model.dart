import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:packit/domain/enum/member_status_enum.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
class LoginResponseModel with _$LoginResponseModel {
  const factory LoginResponseModel({
    required String message,
    required String timestamp,
    required DataModel data,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, Object?> json) => _$LoginResponseModelFromJson(json);
}

@freezed
class DataModel with _$DataModel {
  const factory DataModel({
    required MemberStatusEnum memberStatus,
    required String accessToken,
    required String refreshToken,
  }) = _DataModel;

  factory DataModel.fromJson(Map<String, Object?> json) => _$DataModelFromJson(json);
}
