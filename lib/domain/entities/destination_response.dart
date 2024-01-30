import 'package:freezed_annotation/freezed_annotation.dart';

part 'destination_response.freezed.dart';
part 'destination_response.g.dart';

@freezed
class DestinationResponse with _$DestinationResponse {
  const factory DestinationResponse({
    required int id,
    required String country,
    required String city,
  }) = _DestinationResponse;

  factory DestinationResponse.fromJson(Map<String, Object?> json) => _$DestinationResponseFromJson(json);
}
