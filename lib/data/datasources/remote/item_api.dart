import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

import 'package:packit/domain/entities/packit_item_entity.dart';

import '../../models/packit_empty_response_model.dart';
import '../../models/packit_response_model.dart';

part 'item_api.g.dart';

@RestApi()
abstract class ItemAPI {
  factory ItemAPI(Dio dioBuilder) = _ItemAPI;

  @POST('/travels/items')
  Future<PackitResponseModel<int>> createItem(@Body() PackitItemPostEntity itemPostEntity);

  @DELETE('/travels/items/{itemId}')
  Future<PackitEmptyResponseModel> deleteItem(@Path('itemId') int itemId);

  @PATCH('/travels/items/{itemId}/check')
  Future<PackitEmptyResponseModel> checkItem(@Path('itemId') int itemId);

  @PATCH('/travels/items/{itemId}/uncheck')
  Future<PackitEmptyResponseModel> unCheckItem(@Path('itemId') int itemId);
}
