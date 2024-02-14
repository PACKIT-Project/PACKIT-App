import 'package:get/get.dart';

import '../entities/packit_empty_response.dart';
import '../entities/packit_item_entity.dart';
import '../entities/packit_response.dart';
import '../repositories/item_repository.dart';

class ItemUseCases {
  final ItemRepository _repository = Get.find<ItemRepository>();

  CreateItemUseCase get createItem => CreateItemUseCase(_repository);
  DeleteItemUseCase get deleteItem => DeleteItemUseCase(_repository);
  CheckItemUseCase get checkItem => CheckItemUseCase(_repository);
  UnCheckItemUseCase get unCheckItem => UnCheckItemUseCase(_repository);
}

class CreateItemUseCase {
  final ItemRepository _repository;
  CreateItemUseCase(this._repository);

  Future<PackitResponse<int>> execute(PackitItemPostEntity itemEntity) async {
    return await _repository.createItem(itemEntity);
  }
}

class DeleteItemUseCase {
  final ItemRepository _repository;
  DeleteItemUseCase(this._repository);

  Future<PackitEmptyResponse> execute(int itemId) async {
    return await _repository.deleteItem(itemId);
  }
}

class CheckItemUseCase {
  final ItemRepository _repository;
  CheckItemUseCase(this._repository);

  Future<PackitEmptyResponse> execute(int itemId) async {
    return await _repository.checkItem(itemId);
  }
}

class UnCheckItemUseCase {
  final ItemRepository _repository;
  UnCheckItemUseCase(this._repository);

  Future<PackitEmptyResponse> execute(int itemId) async {
    return await _repository.unCheckItem(itemId);
  }
}
