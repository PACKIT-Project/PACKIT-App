import 'package:freezed_annotation/freezed_annotation.dart';

part 'packit_new_travel_entity.freezed.dart';
part 'packit_new_travel_entity.g.dart';

@freezed
class PackitNewTravelEntity with _$PackitNewTravelEntity {
  const factory PackitNewTravelEntity({
    required String title,
    required int destinationId,
    required DateTime startDate,
    required DateTime endDate,
  }) = _PackitNewTravelEntity;

  factory PackitNewTravelEntity.fromJson(Map<String, Object?> json) => _$PackitNewTravelEntityFromJson(json);
}
