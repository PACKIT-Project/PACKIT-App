// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'check_list_response.freezed.dart';
part 'check_list_response.g.dart';

@freezed
class CheckListResponse with _$CheckListResponse {
  const factory CheckListResponse({
    required int travelId,
    required String title,
    required String destination,
    @JsonKey(fromJson: dateFromJson) required DateTime startDate,
    @JsonKey(fromJson: dateFromJson) required DateTime endDate,
    required int dDay,
    required int memberNum,
    required List<ClusterResponse> travelClusterList,
  }) = _CheckListResponse;

  factory CheckListResponse.fromJson(Map<String, Object?> json) => _$CheckListResponseFromJson(json);
}

@freezed
class ClusterResponse with _$ClusterResponse {
  const factory ClusterResponse({
    required int clusterId,
    required String title,
    required int order,
    required int allItemNum,
    required List<CategoryResponse> travelCategoryList,
  }) = _ClusterResponse;

  factory ClusterResponse.fromJson(Map<String, Object?> json) => _$ClusterResponseFromJson(json);
}

@freezed
class CategoryResponse with _$CategoryResponse {
  const factory CategoryResponse({
    required int categoryId,
    required String title,
    required int order,
    required int allItemNum,
    required int checkedItemNum,
    required List<ItemResponse> travelItemList,
  }) = _CategoryResponse;

  factory CategoryResponse.fromJson(Map<String, Object?> json) => _$CategoryResponseFromJson(json);
}

@freezed
class ItemResponse with _$ItemResponse {
  const factory ItemResponse({
    required int itemId,
    required String title,
    required int order,
    required bool isChecked,
  }) = _ItemResponse;

  factory ItemResponse.fromJson(Map<String, Object?> json) => _$ItemResponseFromJson(json);
}

DateTime dateFromJson(String value) {
  return DateFormat("yyyy.mm.dd").parse(value);
}
