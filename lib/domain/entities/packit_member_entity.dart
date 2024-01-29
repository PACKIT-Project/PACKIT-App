import 'package:freezed_annotation/freezed_annotation.dart';

part 'packit_member_entity.freezed.dart';
part 'packit_member_entity.g.dart';

@freezed
class PackitMemberEntity with _$PackitMemberEntity {
  const factory PackitMemberEntity({
    required int id,
    required String nickname,
    required String profileImageUrl,
    required bool enableNotification,
  }) = _PackitMemberEntity;

  factory PackitMemberEntity.fromJson(Map<String, Object?> json) => _$PackitMemberEntityFromJson(json);
}
