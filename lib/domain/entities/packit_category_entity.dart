import 'package:freezed_annotation/freezed_annotation.dart';

part 'packit_category_entity.freezed.dart';
part 'packit_category_entity.g.dart';

@freezed
class PackitCategoryPostEntity with _$PackitCategoryPostEntity {
  const factory PackitCategoryPostEntity({
    required int clusterId,
    required String title,
  }) = _PackitCategoryPostEntity;

  factory PackitCategoryPostEntity.fromJson(Map<String, Object?> json) => _$PackitCategoryPostEntityFromJson(json);
}

@freezed
class PackitCategoryPatchEntity with _$PackitCategoryPatchEntity {
  const factory PackitCategoryPatchEntity({
    required int categoryId,
    required int title,
  }) = _PackitCategoryPatchEntity;

  factory PackitCategoryPatchEntity.fromJson(Map<String, Object?> json) => _$PackitCategoryPatchEntityFromJson(json);
}
