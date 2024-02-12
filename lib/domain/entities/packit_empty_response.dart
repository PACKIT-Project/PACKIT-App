import 'package:freezed_annotation/freezed_annotation.dart';

part 'packit_empty_response.freezed.dart';
part 'packit_empty_response.g.dart';

@freezed
@JsonSerializable(genericArgumentFactories: true)
class PackitEmptyResponse<T> with _$PackitEmptyResponse<T> {
  const factory PackitEmptyResponse({
    required String message,
    required DateTime timestamp,
    required T data,
  }) = _PackitEmptyResponse;

  factory PackitEmptyResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return _$PackitEmptyResponseFromJson<T>(json, fromJsonT);
  }
}
