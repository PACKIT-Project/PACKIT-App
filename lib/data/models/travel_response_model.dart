import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_response_model.freezed.dart';
part 'travel_response_model.g.dart';

@freezed
class TravelResponseModel with _$TravelResponseModel {
  const factory TravelResponseModel({
    required int id,
    required String title,
    required String destination,
    required DateTime startDate,
    required DateTime endDate,
    required int dDay,
    required int memberNum,
  }) = _TravelResponseModel;

  factory TravelResponseModel.fromJson(Map<String, Object?> json) => _$TravelResponseModelFromJson(json);
}
