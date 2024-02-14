import 'package:freezed_annotation/freezed_annotation.dart';

part 'packit_item_entity.freezed.dart';
part 'packit_item_entity.g.dart';

@freezed
class PackitItemPostEntity with _$PackitItemPostEntity {
  const factory PackitItemPostEntity({
    required int categoryId,
    required String title,
  }) = _PackitItemPostEntity;

  factory PackitItemPostEntity.fromJson(Map<String, Object?> json) => _$PackitItemPostEntityFromJson(json);
}
