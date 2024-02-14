import '../entities/packit_cluster_entity.dart';
import '../entities/packit_empty_response.dart';
import '../entities/packit_response.dart';

abstract class ClusterRepository {
  Future<PackitResponse<int>> createCluster(PackitClusterPostEntity clusterEntity);
  Future<PackitEmptyResponse> deleteCluster(int clusterId);
  Future<PackitEmptyResponse> updateClusterOrder(PackitClusterPatchEntity clusterEntity);
}
