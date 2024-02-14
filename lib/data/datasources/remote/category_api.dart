import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

import 'package:packit/domain/entities/packit_category_entity.dart';

import '../../models/packit_empty_response_model.dart';
import '../../models/packit_response_model.dart';

part 'category_api.g.dart';

@RestApi()
abstract class CategoryAPI {
  factory CategoryAPI(Dio dioBuilder) = _CategoryAPI;

  @POST('/travels/categories')
  Future<PackitResponseModel<int>> createCategory(@Body() PackitCategoryPostEntity categoryPostEntity);

  @DELETE('/travels/categories/{categoryId}')
  Future<PackitEmptyResponseModel> deleteCategory(@Path('categoryId') int categoryId);

  @PATCH('/travels/categories')
  Future<PackitEmptyResponseModel> updateCategory(@Body() PackitCategoryPatchEntity categoryPatchEntity);
}
