import 'package:get/get.dart';

import '../entities/login_response.dart';
import '../entities/packit_login_entity.dart';
import '../entities/packit_refresh_entity.dart';
import '../entities/packit_response.dart';
import '../entities/token_response.dart';
import '../repositories/auth_repository.dart';

class AuthUseCases {
  final AuthRepository _repository = Get.find<AuthRepository>();

  LoginUseCase get login => LoginUseCase(_repository);
  LogoutUseCase get logout => LogoutUseCase(_repository);
  RefreshTokenUseCase get refreshToken => RefreshTokenUseCase(_repository);
}

class LoginUseCase {
  final AuthRepository _repository;
  LoginUseCase(this._repository);

  Future<PackitResponse<LoginResponse>> execute(PackitLoginEntity loginEntity) async {
    return await _repository.login(loginEntity);
  }
}

class LogoutUseCase {
  final AuthRepository _repository;
  LogoutUseCase(this._repository);

  Future<void> execute() async {
    await _repository.logout();
  }
}

class RefreshTokenUseCase {
  final AuthRepository _repository;
  RefreshTokenUseCase(this._repository);

  Future<PackitResponse<TokenResponse>> execute(PackitRefreshEntity refreshEntity) async {
    return await _repository.refreshToken(refreshEntity);
  }
}
