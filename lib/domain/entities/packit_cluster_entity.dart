import 'package:freezed_annotation/freezed_annotation.dart';

part 'packit_cluster_entity.freezed.dart';
part 'packit_cluster_entity.g.dart';

@freezed
class PackitClusterPostEntity with _$PackitClusterPostEntity {
  const factory PackitClusterPostEntity({
    required int travelId,
    required String title,
  }) = _PackitClusterPostEntity;

  factory PackitClusterPostEntity.fromJson(Map<String, Object?> json) => _$PackitClusterPostEntityFromJson(json);
}

@freezed
class PackitClusterPatchEntity with _$PackitClusterPatchEntity {
  const factory PackitClusterPatchEntity({
    required int clusterId,
    required int newOrder,
  }) = _PackitClusterPatchEntity;

  factory PackitClusterPatchEntity.fromJson(Map<String, Object?> json) => _$PackitClusterPatchEntityFromJson(json);
}
