import 'package:get/get.dart';
import 'package:packit/data/models/packit_response_model.dart';

import 'package:packit/domain/entities/login_response.dart';
import 'package:packit/domain/entities/packit_login_entity.dart';
import 'package:packit/domain/entities/packit_response.dart';
import 'package:packit/domain/repositories/auth_repository.dart';

import '../datasources/remote/auth_api.dart';
import '../models/login_response_model.dart';
import 'mappers/auth_mappr.dart';

final AuthMappr _mappr = AuthMappr();

class AuthRepositoryImpl extends AuthRepository {
  final AuthAPI _api = Get.find();

  @override
  Future<PackitResponse<LoginResponse>> login(PackitLoginEntity loginEntity) async {
    PackitResponseModel<LoginResponseModel> response = await _api.login(loginEntity);

    return _mappr.convert<PackitResponseModel<LoginResponseModel>, PackitResponse<LoginResponse>>(response);
  }
}
