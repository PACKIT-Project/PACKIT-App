import 'package:freezed_annotation/freezed_annotation.dart';

part 'packit_register_entity.freezed.dart';
part 'packit_register_entity.g.dart';

@freezed
class PackitRegisterEntity with _$PackitRegisterEntity {
  const factory PackitRegisterEntity({
    required String nickname,
    required String profileImageUrl,
    required bool checkTerms,
    required bool enableNotification,
  }) = _PackitRegisterEntity;

  factory PackitRegisterEntity.fromJson(Map<String, Object?> json) => _$PackitRegisterEntityFromJson(json);
}
