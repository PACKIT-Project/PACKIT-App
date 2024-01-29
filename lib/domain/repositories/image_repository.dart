import 'dart:io';

import '../entities/image_response.dart';
import '../entities/packit_response.dart';

abstract class ImageRepository {
  Future<PackitResponse<ImageResponse>> uploadImage(File uploadImage);
}
