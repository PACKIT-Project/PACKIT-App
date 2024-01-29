import '../entities/login_response.dart';
import '../entities/packit_login_entity.dart';
import '../entities/packit_response.dart';

abstract class AuthRepository {
  Future<PackitResponse<LoginResponse>> login(PackitLoginEntity loginEntity);
}
