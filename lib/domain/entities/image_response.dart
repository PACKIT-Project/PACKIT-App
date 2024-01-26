import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_response.freezed.dart';
part 'image_response.g.dart';

@freezed
class ImageResponse with _$ImageResponse {
  const factory ImageResponse({
    required String message,
    required String timestamp,
    required ImageData data,
  }) = _ImageResponse;

  factory ImageResponse.fromJson(Map<String, Object?> json) => _$ImageResponseFromJson(json);
}

@freezed
class ImageData with _$ImageData {
  const factory ImageData({
    required String savedImageUrl,
  }) = _ImageData;

  factory ImageData.fromJson(Map<String, Object?> json) => _$ImageDataFromJson(json);
}
