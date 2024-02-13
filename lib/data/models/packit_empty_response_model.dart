import 'package:freezed_annotation/freezed_annotation.dart';

part 'packit_empty_response_model.freezed.dart';
part 'packit_empty_response_model.g.dart';

@freezed
@JsonSerializable(genericArgumentFactories: true)
class PackitEmptyResponseModel<T> with _$PackitEmptyResponseModel<T> {
  const factory PackitEmptyResponseModel({
    required String message,
    required DateTime timestamp,
    required T data,
  }) = _PackitEmptyResponseModel;

  factory PackitEmptyResponseModel.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return _$PackitEmptyResponseModelFromJson<T>(json, fromJsonT);
  }
}
