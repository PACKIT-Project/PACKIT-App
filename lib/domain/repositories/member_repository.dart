import '../entities/check_nick_response.dart';
import '../entities/member_response.dart';
import '../entities/packit_register_entity.dart';
import '../entities/packit_response.dart';
import '../entities/register_response.dart';

abstract class MemberRepository {
  Future<PackitResponse<CheckNickResponse>> checkNickname(String nickname);
  Future<PackitResponse<MemberResponse>> getMemberProfile();
  Future<PackitResponse<RegisterResponse>> register(PackitRegisterEntity registerEntity);
}
