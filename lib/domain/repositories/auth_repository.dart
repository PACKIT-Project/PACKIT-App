import '../entities/login_response.dart';
import '../entities/packit_login_entity.dart';
import '../entities/packit_refresh_entity.dart';
import '../entities/packit_response.dart';
import '../entities/token_response.dart';

abstract class AuthRepository {
  Future<PackitResponse<LoginResponse>> login(PackitLoginEntity loginEntity);
  Future<void> logout();
  Future<PackitResponse<TokenResponse>> refreshToken(PackitRefreshEntity refreshEntity);
}
