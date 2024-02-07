import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_response.freezed.dart';
part 'travel_response.g.dart';

@freezed
class TravelResponse with _$TravelResponse {
  const factory TravelResponse({
    required int id,
    required String title,
    required String destination,
    required DateTime startDate,
    required DateTime endDate,
    required int dDay,
    required int memberNum,
  }) = _TravelResponse;

  factory TravelResponse.fromJson(Map<String, Object?> json) => _$TravelResponseFromJson(json);
}
