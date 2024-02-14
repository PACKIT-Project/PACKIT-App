import 'package:get/get.dart';

import '../entities/packit_category_entity.dart';
import '../entities/packit_empty_response.dart';
import '../entities/packit_response.dart';
import '../repositories/category_repository.dart';

class CategoryUseCases {
  final CategoryRepository _repository = Get.find<CategoryRepository>();

  CreateCategoryUseCase get createCategory => CreateCategoryUseCase(_repository);
  DeleteCategoryUseCase get deleteCategory => DeleteCategoryUseCase(_repository);
  UpdateCategoryUseCase get updateCategory => UpdateCategoryUseCase(_repository);
}

class CreateCategoryUseCase {
  final CategoryRepository _repository;
  CreateCategoryUseCase(this._repository);

  Future<PackitResponse<int>> execute(PackitCategoryPostEntity categoryPostEntity) async {
    return await _repository.createCategory(categoryPostEntity);
  }
}

class DeleteCategoryUseCase {
  final CategoryRepository _repository;
  DeleteCategoryUseCase(this._repository);

  Future<PackitEmptyResponse> execute(int categoryId) async {
    return await _repository.deleteCategory(categoryId);
  }
}

class UpdateCategoryUseCase {
  final CategoryRepository _repository;
  UpdateCategoryUseCase(this._repository);

  Future<PackitEmptyResponse> execute(PackitCategoryPatchEntity categoryPatchEntity) async {
    return await _repository.updateCategory(categoryPatchEntity);
  }
}
