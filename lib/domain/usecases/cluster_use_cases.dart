import 'package:get/get.dart';

import '../entities/packit_cluster_entity.dart';
import '../entities/packit_empty_response.dart';
import '../entities/packit_response.dart';
import '../repositories/cluster_repository.dart';

class ClusterUseCases {
  final ClusterRepository _repository = Get.find<ClusterRepository>();

  CreateClusterUseCase get createCluster => CreateClusterUseCase(_repository);
  DeleteClusterUseCase get deleteCluster => DeleteClusterUseCase(_repository);
  UpdateClusterOrderUseCase get updateClusterOrder => UpdateClusterOrderUseCase(_repository);
}

class CreateClusterUseCase {
  final ClusterRepository _repository;
  CreateClusterUseCase(this._repository);

  Future<PackitResponse<int>> execute(PackitClusterPostEntity clusterEntity) async {
    return await _repository.createCluster(clusterEntity);
  }
}

class DeleteClusterUseCase {
  final ClusterRepository _repository;
  DeleteClusterUseCase(this._repository);

  Future<PackitEmptyResponse> execute(int clusterId) async {
    return await _repository.deleteCluster(clusterId);
  }
}

class UpdateClusterOrderUseCase {
  final ClusterRepository _repository;
  UpdateClusterOrderUseCase(this._repository);

  Future<PackitEmptyResponse> execute(PackitClusterPatchEntity clusterEntity) async {
    return await _repository.updateClusterOrder(clusterEntity);
  }
}
