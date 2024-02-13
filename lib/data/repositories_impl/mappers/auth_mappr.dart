import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';

import 'package:packit/domain/entities/login_response.dart';
import 'package:packit/domain/entities/packit_empty_response.dart';
import 'package:packit/domain/entities/packit_response.dart';
import 'package:packit/domain/entities/token_response.dart';

import '../../models/login_response_model.dart';
import '../../models/packit_empty_response_model.dart';
import '../../models/packit_response_model.dart';
import '../../models/token_response_model.dart';
import 'auth_mappr.auto_mappr.dart';

@AutoMappr([
  MapType<PackitEmptyResponseModel, PackitEmptyResponse>(),
  MapType<PackitResponseModel, PackitResponse>(),
  MapType<LoginResponseModel, LoginResponse>(),
  MapType<PackitResponseModel<LoginResponseModel>, PackitResponse<LoginResponse>>(),
  MapType<TokenResponseModel, TokenResponse>(),
  MapType<PackitResponseModel<TokenResponseModel>, PackitResponse<TokenResponse>>(),
])
class AuthMappr extends $AuthMappr {}
