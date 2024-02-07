import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';

import 'package:packit/domain/entities/packit_response.dart';

import '../../models/packit_response_model.dart';
import 'travel_mappr.auto_mappr.dart';

@AutoMappr([
  MapType<PackitResponseModel<int>, PackitResponse<int>>(),
])
class TravelMappr extends $TravelMappr {}
