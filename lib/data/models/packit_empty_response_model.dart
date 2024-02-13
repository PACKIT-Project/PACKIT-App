import 'package:freezed_annotation/freezed_annotation.dart';

part 'packit_empty_response_model.freezed.dart';
part 'packit_empty_response_model.g.dart';

@freezed
class PackitEmptyResponseModel with _$PackitEmptyResponseModel {
  const factory PackitEmptyResponseModel({
    required String message,
    required DateTime timestamp,
  }) = _PackitEmptyResponseModel;

  factory PackitEmptyResponseModel.fromJson(Map<String, Object?> json) => _$PackitEmptyResponseModelFromJson(json);
}
