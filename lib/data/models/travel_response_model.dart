// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'travel_response_model.freezed.dart';
part 'travel_response_model.g.dart';

@freezed
class TravelResponseModel with _$TravelResponseModel {
  const factory TravelResponseModel({
    required int id,
    required String title,
    required String destination,
    @JsonKey(fromJson: dateFromJson) required DateTime startDate,
    @JsonKey(fromJson: dateFromJson) required DateTime endDate,
    @JsonKey(fromJson: dDayFromJson) required int dDay,
    required int memberNum,
  }) = _TravelResponseModel;

  factory TravelResponseModel.fromJson(Map<String, Object?> json) => _$TravelResponseModelFromJson(json);
}

int dDayFromJson(String value) {
  return int.parse(value);
}

DateTime dateFromJson(String value) {
  return DateFormat("yyyy.mm.dd").parse(value);
}
