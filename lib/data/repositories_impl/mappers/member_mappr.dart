import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';

import 'package:packit/domain/entities/check_nick_response.dart';
import 'package:packit/domain/entities/packit_response.dart';
import 'package:packit/domain/entities/register_response.dart';

import '../../models/check_nick_response_model.dart';
import '../../models/packit_response_model.dart';
import '../../models/register_response_model.dart';
import 'member_mappr.auto_mappr.dart';

@AutoMappr([
  MapType<PackitResponseModel, PackitResponse>(),
  MapType<CheckNickResponseModel, CheckNickResponse>(),
  MapType<PackitResponseModel<CheckNickResponseModel>, PackitResponse<CheckNickResponse>>(),
  MapType<RegisterResponseModel, RegisterResponse>(),
  MapType<PackitResponseModel<RegisterResponseModel>, PackitResponse<RegisterResponse>>(),
])
class MemberMappr extends $MemberMappr {}
