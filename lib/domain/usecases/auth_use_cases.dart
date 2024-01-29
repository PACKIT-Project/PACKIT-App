import 'package:get/get.dart';

import '../entities/login_response.dart';
import '../entities/packit_login_entity.dart';
import '../entities/packit_response.dart';
import '../repositories/auth_repository.dart';

class AuthUseCases {
  final AuthRepository _repository = Get.find<AuthRepository>();

  LoginUseCase get login => LoginUseCase(_repository);
}

class LoginUseCase {
  final AuthRepository _repository;
  LoginUseCase(this._repository);

  Future<PackitResponse<LoginResponse>> execute(PackitLoginEntity loginEntity) async {
    return await _repository.login(loginEntity);
  }
}
