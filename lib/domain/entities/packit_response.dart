import 'package:freezed_annotation/freezed_annotation.dart';

part 'packit_response.freezed.dart';
part 'packit_response.g.dart';

@freezed
@JsonSerializable(genericArgumentFactories: true)
class PackitResponse<T> with _$PackitResponse<T> {
  const factory PackitResponse({
    required String message,
    required DateTime timestamp,
    required T data,
  }) = _PackitResponse;

  factory PackitResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return _$PackitResponseFromJson<T>(json, fromJsonT);
  }
}
