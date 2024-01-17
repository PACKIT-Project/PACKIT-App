import '../entities/login_response.dart';
import '../entities/packit_login_entity.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(PackitLoginEntity loginEntity);
}
