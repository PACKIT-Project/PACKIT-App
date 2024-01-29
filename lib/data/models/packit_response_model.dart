import 'package:freezed_annotation/freezed_annotation.dart';

part 'packit_response_model.freezed.dart';
part 'packit_response_model.g.dart';

@freezed
@JsonSerializable(genericArgumentFactories: true)
class PackitResponseModel<T> with _$PackitResponseModel<T> {
  const factory PackitResponseModel({
    required String message,
    required DateTime timestamp,
    required T data,
  }) = _PackitResponseModel;

  factory PackitResponseModel.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return _$PackitResponseModelFromJson<T>(json, fromJsonT);
  }
}
