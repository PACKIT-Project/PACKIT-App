import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

import 'package:packit/domain/entities/packit_login_entity.dart';
import 'package:packit/domain/entities/packit_refresh_entity.dart';

import '../../models/login_response_model.dart';
import '../../models/packit_empty_response_model.dart';
import '../../models/packit_response_model.dart';
import '../../models/token_response_model.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthAPI {
  factory AuthAPI(Dio dioBuilder) = _AuthAPI;

  @POST('/auth/mobile/login')
  @Headers({'withToken': 'false'})
  Future<PackitResponseModel<LoginResponseModel>> login(@Body() PackitLoginEntity loginEntity);

  @DELETE('/auth/mobile/logout')
  Future<PackitEmptyResponseModel> logout();

  @POST('/auth/mobile/refresh')
  @Headers({'withToken': 'false'})
  Future<PackitResponseModel<TokenResponseModel>> refreshToken(@Body() PackitRefreshEntity refreshEntity);
}
