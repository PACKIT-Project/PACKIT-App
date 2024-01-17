import 'package:dio/dio.dart';
import 'package:packit/domain/entities/packit_login_entity.dart';
import 'package:retrofit/http.dart';

import '../../models/login_response_model.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthAPI {
  factory AuthAPI(Dio dioBuilder) = _AuthAPI;

  @POST('/auth/mobile/login')
  Future<LoginResponseModel> login(@Body() PackitLoginEntity loginEntity);
}
