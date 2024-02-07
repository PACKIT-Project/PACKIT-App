import 'package:freezed_annotation/freezed_annotation.dart';

part 'destination_response_model.freezed.dart';
part 'destination_response_model.g.dart';

@freezed
class DestinationResponseModel with _$DestinationResponseModel {
  const factory DestinationResponseModel({
    required int id,
    required String country,
    required String city,
  }) = _DestinationResponseModel;

  factory DestinationResponseModel.fromJson(Map<String, Object?> json) => _$DestinationResponseModelFromJson(json);
}
