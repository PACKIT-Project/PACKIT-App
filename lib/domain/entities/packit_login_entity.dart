import 'package:freezed_annotation/freezed_annotation.dart';

part 'packit_login_entity.freezed.dart';
part 'packit_login_entity.g.dart';

@freezed
class PackitLoginEntity with _$PackitLoginEntity {
  const factory PackitLoginEntity({
    required String memberPersonalId,
    required String loginProvider,
  }) = _PackitLoginEntity;

  factory PackitLoginEntity.fromJson(Map<String, Object?> json) => _$PackitLoginEntityFromJson(json);
}
