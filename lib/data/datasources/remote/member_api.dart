import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'package:packit/domain/entities/packit_register_entity.dart';

import '../../models/check_nick_response_model.dart';
import '../../models/member_response_model.dart';
import '../../models/packit_response_model.dart';
import '../../models/register_response_model.dart';

part 'member_api.g.dart';

@RestApi()
abstract class MemberAPI {
  factory MemberAPI(Dio dioBuilder) = _MemberAPI;

  @GET('/members/nicknames/is-duplicate')
  Future<PackitResponseModel<CheckNickResponseModel>> checkNickname(@Query('nickname') String nickname);

  @GET('/members/profiles')
  Future<PackitResponseModel<MemberResponseModel>> getMemberProfile();

  @POST('/members')
  Future<PackitResponseModel<RegisterResponseModel>> register(@Body() PackitRegisterEntity registerEntity);
}
