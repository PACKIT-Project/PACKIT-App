import 'package:get/get.dart';

import '../entities/check_nick_response.dart';
import '../entities/member_response.dart';
import '../entities/packit_register_entity.dart';
import '../entities/packit_response.dart';
import '../entities/register_response.dart';
import '../repositories/member_repository.dart';

class MemberUseCases {
  final MemberRepository _repository = Get.find<MemberRepository>();

  CheckNicknameUseCase get checkNickname => CheckNicknameUseCase(_repository);
  GetMemberProfileUseCase get getMemberProfile => GetMemberProfileUseCase(_repository);
  RegisterUseCase get register => RegisterUseCase(_repository);
}

class CheckNicknameUseCase {
  final MemberRepository _repository;
  CheckNicknameUseCase(this._repository);

  Future<PackitResponse<CheckNickResponse>> execute(String nickname) async {
    return await _repository.checkNickname(nickname);
  }
}

class GetMemberProfileUseCase {
  final MemberRepository _repository;
  GetMemberProfileUseCase(this._repository);

  Future<PackitResponse<MemberResponse>> execute() async {
    return await _repository.getMemberProfile();
  }
}

class RegisterUseCase {
  final MemberRepository _repository;
  RegisterUseCase(this._repository);

  Future<PackitResponse<RegisterResponse>> execute(PackitRegisterEntity registerEntity) async {
    return await _repository.register(registerEntity);
  }
}
