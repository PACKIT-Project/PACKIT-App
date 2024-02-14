import 'package:get/get.dart';

import 'package:packit/domain/entities/packit_category_entity.dart';
import 'package:packit/domain/entities/packit_empty_response.dart';
import 'package:packit/domain/entities/packit_response.dart';
import 'package:packit/domain/repositories/category_repository.dart';

import '../datasources/remote/category_api.dart';
import '../models/packit_empty_response_model.dart';
import '../models/packit_response_model.dart';
import 'mappers/category_mappr.dart';

final CategoryMappr _mappr = CategoryMappr();

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryAPI _api = Get.find();

  @override
  Future<PackitResponse<int>> createCategory(PackitCategoryPostEntity categoryPostEntity) async {
    final PackitResponseModel<int> response = await _api.createCategory(categoryPostEntity);

    return _mappr.convert<PackitResponseModel<int>, PackitResponse<int>>(response);
  }

  @override
  Future<PackitEmptyResponse> deleteCategory(int categoryId) async {
    final PackitEmptyResponseModel response = await _api.deleteCategory(categoryId);

    return _mappr.convert<PackitEmptyResponseModel, PackitEmptyResponse>(response);
  }

  @override
  Future<PackitEmptyResponse> updateCategory(PackitCategoryPatchEntity categoryPatchEntity) async {
    final PackitEmptyResponseModel response = await _api.updateCategory(categoryPatchEntity);

    return _mappr.convert<PackitEmptyResponseModel, PackitEmptyResponse>(response);
  }
}
