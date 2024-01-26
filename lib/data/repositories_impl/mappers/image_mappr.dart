import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';

import 'package:packit/domain/entities/image_response.dart';

import '../../models/image_response_model.dart';
import 'image_mappr.auto_mappr.dart';

@AutoMappr([
  MapType<ImageResponseModel, ImageResponse>(),
  MapType<ImageDataModel, ImageData>(),
])
class ImageMappr extends $ImageMappr {}
