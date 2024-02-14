// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'check_list_response_model.freezed.dart';
part 'check_list_response_model.g.dart';

@freezed
class CheckListResponseModel with _$CheckListResponseModel {
  const factory CheckListResponseModel({
    required int id,
    required String title,
    required String destination,
    @JsonKey(fromJson: dateFromJson) required DateTime startDate,
    @JsonKey(fromJson: dateFromJson) required DateTime endDate,
    @JsonKey(fromJson: dDayFromJson) required int dDay,
    required int memberNum,
    required List<ClusterResponseModel> travelClusterList,
  }) = _CheckListResponseModel;

  factory CheckListResponseModel.fromJson(Map<String, Object?> json) => _$CheckListResponseModelFromJson(json);
}

@freezed
class ClusterResponseModel with _$ClusterResponseModel {
  const factory ClusterResponseModel({
    required int clusterId,
    required String title,
    required int order,
    required int allItemNum,
    required List<CategoryResponseModel> travelCategoryList,
  }) = _ClusterResponseModel;

  factory ClusterResponseModel.fromJson(Map<String, Object?> json) => _$ClusterResponseModelFromJson(json);
}

@freezed
class CategoryResponseModel with _$CategoryResponseModel {
  const factory CategoryResponseModel({
    required int categoryId,
    required String title,
    required int order,
    required int allItemNum,
    required int checkedItemNum,
    required List<ItemResponseModel> travelItemList,
  }) = _CategoryResponseModel;

  factory CategoryResponseModel.fromJson(Map<String, Object?> json) => _$CategoryResponseModelFromJson(json);
}

@freezed
class ItemResponseModel with _$ItemResponseModel {
  const factory ItemResponseModel({
    required int itemId,
    required String title,
    required int order,
    required bool isChecked,
  }) = _ItemResponseModel;

  factory ItemResponseModel.fromJson(Map<String, Object?> json) => _$ItemResponseModelFromJson(json);
}

int dDayFromJson(String value) {
  return int.parse(value);
}

DateTime dateFromJson(String value) {
  return DateFormat("yyyy.mm.dd").parse(value);
}
