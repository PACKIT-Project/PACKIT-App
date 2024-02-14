import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

import 'package:packit/domain/entities/packit_cluster_entity.dart';

import '../../models/packit_empty_response_model.dart';
import '../../models/packit_response_model.dart';

part 'cluster_api.g.dart';

@RestApi()
abstract class ClusterAPI {
  factory ClusterAPI(Dio dioBuilder) = _ClusterAPI;

  @POST('/travels/clusters')
  Future<PackitResponseModel<int>> createCluster(@Body() PackitClusterPostEntity clusterPostEntity);

  @DELETE('/travels/clusters/{clusterId}')
  Future<PackitEmptyResponseModel> deleteCluster(@Path('clusterId') int clusterId);

  @PATCH('/travels/clusters/reorder')
  Future<PackitEmptyResponseModel> updateClusterOrder(@Body() PackitClusterPatchEntity clusterPatchEntity);
}
