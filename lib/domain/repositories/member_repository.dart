import 'package:packit/domain/entities/packit_register_entity.dart';
import 'package:packit/domain/entities/register_response.dart';

import '../entities/check_nick_response.dart';
import '../entities/packit_response.dart';

abstract class MemberRepository {
  Future<PackitResponse<CheckNickResponse>> checkNickname(String nickname);

  Future<PackitResponse<RegisterResponse>> register(PackitRegisterEntity registerEntity);
}
