import 'package:freezed_annotation/freezed_annotation.dart';

part 'packit_empty_response.freezed.dart';
part 'packit_empty_response.g.dart';

@freezed
class PackitEmptyResponse with _$PackitEmptyResponse {
  const factory PackitEmptyResponse({
    required String message,
    required DateTime timestamp,
  }) = _PackitEmptyResponse;

  factory PackitEmptyResponse.fromJson(Map<String, Object?> json) => _$PackitEmptyResponseFromJson(json);
}
