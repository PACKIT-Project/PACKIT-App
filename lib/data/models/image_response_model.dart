import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_response_model.freezed.dart';
part 'image_response_model.g.dart';

@freezed
class ImageResponseModel with _$ImageResponseModel {
  const factory ImageResponseModel({
    required String message,
    required String timestamp,
    required ImageDataModel data,
  }) = _ImageResponseModel;

  factory ImageResponseModel.fromJson(Map<String, Object?> json) => _$ImageResponseModelFromJson(json);
}

@freezed
class ImageDataModel with _$ImageDataModel {
  const factory ImageDataModel({
    required String savedImageUrl,
  }) = _ImageDataModel;

  factory ImageDataModel.fromJson(Map<String, Object?> json) => _$ImageDataModelFromJson(json);
}
