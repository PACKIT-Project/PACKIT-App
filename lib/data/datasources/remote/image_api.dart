import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../models/image_response_model.dart';

part 'image_api.g.dart';

@RestApi()
abstract class ImageAPI {
  factory ImageAPI(Dio dioBuilder) = _ImageAPI;

  @POST('/images')
  @MultiPart()
  Future<ImageResponseModel> uploadImage(@Part() File uploadImage);
}
