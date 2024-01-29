import 'package:freezed_annotation/freezed_annotation.dart';

part 'packit_error_response.freezed.dart';
part 'packit_error_response.g.dart';

@freezed
class PackitErrorResponse with _$PackitErrorResponse {
  const factory PackitErrorResponse({
    required String errorCode,
    required String message,
    required DateTime timestamp,
  }) = _PackitErrorResponse;

  factory PackitErrorResponse.fromJson(Map<String, Object?> json) => _$PackitErrorResponseFromJson(json);
}
