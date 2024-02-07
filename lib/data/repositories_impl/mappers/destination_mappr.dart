import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';

import 'package:packit/domain/entities/destination_response.dart';
import 'package:packit/domain/entities/packit_response.dart';

import '../../models/destination_response_model.dart';
import '../../models/packit_response_model.dart';
import 'destination_mappr.auto_mappr.dart';

@AutoMappr([
  MapType<PackitResponseModel, PackitResponse>(),
  MapType<DestinationResponseModel, DestinationResponse>(),
  MapType<PackitResponseModel<List<DestinationResponseModel>>, PackitResponse<List<DestinationResponse>>>(),
])
class DestinationMappr extends $DestinationMappr {}
