import 'package:freezed_annotation/freezed_annotation.dart';

part 'packit_refresh_entity.freezed.dart';
part 'packit_refresh_entity.g.dart';

@freezed
class PackitRefreshEntity with _$PackitRefreshEntity {
  const factory PackitRefreshEntity({
    required String expiredAccessToken,
    required String refreshToken,
  }) = _PackitRefreshEntity;

  factory PackitRefreshEntity.fromJson(Map<String, Object?> json) => _$PackitRefreshEntityFromJson(json);
}
