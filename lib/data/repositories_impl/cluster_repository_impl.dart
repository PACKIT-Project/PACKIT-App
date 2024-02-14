import 'package:get/get.dart';

import 'package:packit/domain/entities/packit_cluster_entity.dart';
import 'package:packit/domain/entities/packit_empty_response.dart';
import 'package:packit/domain/entities/packit_response.dart';
import 'package:packit/domain/repositories/cluster_repository.dart';

import '../datasources/remote/cluster_api.dart';
import '../models/packit_empty_response_model.dart';
import '../models/packit_response_model.dart';
import 'mappers/cluster_mappr.dart';

final ClusterMappr _mappr = ClusterMappr();

class ClusterRepositoryImpl extends ClusterRepository {
  final ClusterAPI _api = Get.find();

  @override
  Future<PackitResponse<int>> createCluster(PackitClusterPostEntity clusterEntity) async {
    final PackitResponseModel<int> response = await _api.createCluster(clusterEntity);

    return _mappr.convert<PackitResponseModel<int>, PackitResponse<int>>(response);
  }

  @override
  Future<PackitEmptyResponse> deleteCluster(int clusterId) async {
    final PackitEmptyResponseModel response = await _api.deleteCluster(clusterId);

    return _mappr.convert<PackitEmptyResponseModel, PackitEmptyResponse>(response);
  }

  @override
  Future<PackitEmptyResponse> updateClusterOrder(PackitClusterPatchEntity clusterEntity) async {
    final PackitEmptyResponseModel response = await _api.updateClusterOrder(clusterEntity);

    return _mappr.convert<PackitEmptyResponseModel, PackitEmptyResponse>(response);
  }
}
