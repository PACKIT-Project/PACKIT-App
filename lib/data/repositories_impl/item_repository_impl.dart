import 'package:get/get.dart';

import 'package:packit/domain/entities/packit_empty_response.dart';
import 'package:packit/domain/entities/packit_item_entity.dart';
import 'package:packit/domain/entities/packit_response.dart';
import 'package:packit/domain/repositories/item_repository.dart';

import '../datasources/remote/item_api.dart';
import '../models/packit_empty_response_model.dart';
import '../models/packit_response_model.dart';
import 'mappers/item_mappr.dart';

final ItemMappr _mappr = ItemMappr();

class ItemRepositoryImpl extends ItemRepository {
  final ItemAPI _api = Get.find();

  @override
  Future<PackitResponse<int>> createItem(PackitItemPostEntity itemEntity) async {
    final PackitResponseModel<int> response = await _api.createItem(itemEntity);

    return _mappr.convert<PackitResponseModel<int>, PackitResponse<int>>(response);
  }

  @override
  Future<PackitEmptyResponse> deleteItem(int itemId) async {
    final PackitEmptyResponseModel response = await _api.deleteItem(itemId);

    return _mappr.convert<PackitEmptyResponseModel, PackitEmptyResponse>(response);
  }

  @override
  Future<PackitEmptyResponse> checkItem(int itemId) async {
    final PackitEmptyResponseModel response = await _api.checkItem(itemId);

    return _mappr.convert<PackitEmptyResponseModel, PackitEmptyResponse>(response);
  }

  @override
  Future<PackitEmptyResponse> unCheckItem(int itemId) async {
    final PackitEmptyResponseModel response = await _api.unCheckItem(itemId);

    return _mappr.convert<PackitEmptyResponseModel, PackitEmptyResponse>(response);
  }
}
