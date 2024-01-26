import 'dart:io';

import '../entities/image_response.dart';

abstract class ImageRepository {
  Future<ImageResponse> uploadImage(File uploadImage);
}
