import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'package:packit/domain/entities/packit_login_entity.dart';

import '../../models/login_response_model.dart';
import '../../models/packit_response_model.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthAPI {
  factory AuthAPI(Dio dioBuilder) = _AuthAPI;

  @POST('/auth/mobile/login')
  Future<PackitResponseModel<LoginResponseModel>> login(@Body() PackitLoginEntity loginEntity);
}
