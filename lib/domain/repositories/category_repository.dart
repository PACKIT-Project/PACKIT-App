import '../entities/packit_category_entity.dart';
import '../entities/packit_empty_response.dart';
import '../entities/packit_response.dart';

abstract class CategoryRepository {
  Future<PackitResponse<int>> createCategory(PackitCategoryPostEntity categoryPostEntity);
  Future<PackitEmptyResponse> deleteCategory(int categoryId);
  Future<PackitEmptyResponse> updateCategory(PackitCategoryPatchEntity categoryPatchEntity);
}
