import 'package:get/get.dart';
import 'package:packit/data/models/member_response_model.dart';

import 'package:packit/domain/entities/check_nick_response.dart';
import 'package:packit/domain/entities/member_response.dart';
import 'package:packit/domain/entities/packit_register_entity.dart';
import 'package:packit/domain/entities/packit_response.dart';
import 'package:packit/domain/entities/register_response.dart';
import 'package:packit/domain/repositories/member_repository.dart';

import '../datasources/remote/member_api.dart';
import '../models/check_nick_response_model.dart';
import '../models/packit_response_model.dart';
import '../models/register_response_model.dart';
import 'mappers/member_mappr.dart';

final MemberMappr _mappr = MemberMappr();

class MemberRepositoryImpl extends MemberRepository {
  final MemberAPI _api = Get.find();

  @override
  Future<PackitResponse<CheckNickResponse>> checkNickname(String nickname) async {
    PackitResponseModel<CheckNickResponseModel> response = await _api.checkNickname(nickname);

    return _mappr.convert<PackitResponseModel<CheckNickResponseModel>, PackitResponse<CheckNickResponse>>(response);
  }

  @override
  Future<PackitResponse<MemberResponse>> getMemberProfile() async {
    PackitResponseModel<MemberResponseModel> response = await _api.getMemberProfile();

    return _mappr.convert<PackitResponseModel<MemberResponseModel>, PackitResponse<MemberResponse>>(response);
  }

  @override
  Future<PackitResponse<RegisterResponse>> register(PackitRegisterEntity registerEntity) async {
    PackitResponseModel<RegisterResponseModel> response = await _api.register(registerEntity);

    return _mappr.convert<PackitResponseModel<RegisterResponseModel>, PackitResponse<RegisterResponse>>(response);
  }
}
