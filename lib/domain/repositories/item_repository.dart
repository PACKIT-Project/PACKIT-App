import '../entities/packit_empty_response.dart';
import '../entities/packit_item_entity.dart';
import '../entities/packit_response.dart';

abstract class ItemRepository {
  Future<PackitResponse<int>> createItem(PackitItemPostEntity itemEntity);
  Future<PackitEmptyResponse> deleteItem(int itemId);
  Future<PackitEmptyResponse> checkItem(int itemId);
  Future<PackitEmptyResponse> unCheckItem(int itemId);
}
