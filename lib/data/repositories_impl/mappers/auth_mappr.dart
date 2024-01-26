import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';

import 'package:packit/domain/entities/login_response.dart';

import '../../models/login_response_model.dart';
import 'auth_mappr.auto_mappr.dart';

@AutoMappr([
  MapType<LoginResponseModel, LoginResponse>(),
  MapType<LoginDataModel, LoginData>(),
])
class AuthMappr extends $AuthMappr {}
