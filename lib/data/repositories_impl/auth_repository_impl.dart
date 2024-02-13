import 'package:get/get.dart';

import 'package:packit/domain/entities/login_response.dart';
import 'package:packit/domain/entities/packit_empty_response.dart';
import 'package:packit/domain/entities/packit_login_entity.dart';
import 'package:packit/domain/entities/packit_refresh_entity.dart';
import 'package:packit/domain/entities/packit_response.dart';
import 'package:packit/domain/entities/token_response.dart';
import 'package:packit/domain/repositories/auth_repository.dart';

import '../datasources/remote/auth_api.dart';
import '../models/login_response_model.dart';
import '../models/packit_empty_response_model.dart';
import '../models/packit_response_model.dart';
import '../models/token_response_model.dart';
import 'mappers/auth_mappr.dart';

final AuthMappr _mappr = AuthMappr();

class AuthRepositoryImpl extends AuthRepository {
  final AuthAPI _api = Get.find();

  @override
  Future<PackitResponse<LoginResponse>> login(PackitLoginEntity loginEntity) async {
    PackitResponseModel<LoginResponseModel> response = await _api.login(loginEntity);

    return _mappr.convert<PackitResponseModel<LoginResponseModel>, PackitResponse<LoginResponse>>(response);
  }

  @override
  Future<PackitEmptyResponse> logout() async {
    PackitEmptyResponseModel response = await _api.logout();

    return _mappr.convert<PackitEmptyResponseModel, PackitEmptyResponse>(response);
  }

  @override
  Future<PackitResponse<TokenResponse>> refreshToken(PackitRefreshEntity refreshEntity) async {
    PackitResponseModel<TokenResponseModel> response = await _api.refreshToken(refreshEntity);

    return _mappr.convert<PackitResponseModel<TokenResponseModel>, PackitResponse<TokenResponse>>(response);
  }
}
