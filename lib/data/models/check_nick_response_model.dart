import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_nick_response_model.freezed.dart';
part 'check_nick_response_model.g.dart';

@freezed
class CheckNickResponseModel with _$CheckNickResponseModel {
  const factory CheckNickResponseModel({
    required bool isDuplicated,
  }) = _CheckNickResponseModel;

  factory CheckNickResponseModel.fromJson(Map<String, Object?> json) => _$CheckNickResponseModelFromJson(json);
}
