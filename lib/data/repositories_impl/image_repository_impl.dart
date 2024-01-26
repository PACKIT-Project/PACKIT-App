import 'dart:io';

import 'package:get/get.dart';

import 'package:packit/domain/entities/image_response.dart';
import 'package:packit/domain/repositories/image_repository.dart';

import '../datasources/remote/image_api.dart';
import '../models/image_response_model.dart';
import 'mappers/image_mappr.dart';

final ImageMappr _mappr = ImageMappr();

class ImageRepositoryImpl extends ImageRepository {
  final ImageAPI _api = Get.find();

  @override
  Future<ImageResponse> uploadImage(File uploadImage) async {
    ImageResponseModel response = await _api.uploadImage(uploadImage);

    return _mappr.convert<ImageResponseModel, ImageResponse>(response);
  }
}
