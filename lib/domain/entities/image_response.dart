import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_response.freezed.dart';
part 'image_response.g.dart';

@freezed
class ImageResponse with _$ImageResponse {
  const factory ImageResponse({
    required String savedImageUrl,
  }) = _ImageResponse;

  factory ImageResponse.fromJson(Map<String, Object?> json) => _$ImageResponseFromJson(json);
}
