import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../entities/image_response.dart';
import '../repositories/image_repository.dart';

class ImageUseCases {
  final ImageRepository _repository = Get.find<ImageRepository>();

  UploadImageUseCase get uploadImage => UploadImageUseCase(_repository);
}

class UploadImageUseCase {
  final ImageRepository _repository;
  UploadImageUseCase(this._repository);

  Future<ImageResponse> execute(XFile imageFile) async {
    return await _repository.uploadImage(File(imageFile.path));
  }
}
