import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';

import 'package:packit/domain/entities/packit_empty_response.dart';
import 'package:packit/domain/entities/packit_response.dart';

import '../../models/packit_empty_response_model.dart';
import '../../models/packit_response_model.dart';
import 'cluster_mappr.auto_mappr.dart';

@AutoMappr([
  MapType<PackitEmptyResponseModel, PackitEmptyResponse>(),
  MapType<PackitResponseModel, PackitResponse>(),
  MapType<PackitResponseModel<int>, PackitResponse<int>>(),
])
class ClusterMappr extends $ClusterMappr {}
