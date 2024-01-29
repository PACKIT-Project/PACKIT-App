import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';

import 'package:packit/domain/entities/image_response.dart';
import 'package:packit/domain/entities/packit_response.dart';

import '../../models/image_response_model.dart';
import '../../models/packit_response_model.dart';
import 'image_mappr.auto_mappr.dart';

@AutoMappr([
  MapType<PackitResponseModel, PackitResponse>(),
  MapType<ImageResponseModel, ImageResponse>(),
  MapType<PackitResponseModel<ImageResponseModel>, PackitResponse<ImageResponse>>(),
])
class ImageMappr extends $ImageMappr {}
