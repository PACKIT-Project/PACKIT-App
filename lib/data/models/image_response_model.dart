import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_response_model.freezed.dart';
part 'image_response_model.g.dart';

@freezed
class ImageResponseModel with _$ImageResponseModel {
  const factory ImageResponseModel({
    required String savedImageUrl,
  }) = _ImageResponseModel;

  factory ImageResponseModel.fromJson(Map<String, Object?> json) => _$ImageResponseModelFromJson(json);
}
