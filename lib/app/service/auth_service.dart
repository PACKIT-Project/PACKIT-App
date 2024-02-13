import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/data/datasources/local/auth_local_data_source.dart';
import 'package:packit/domain/entities/login_response.dart';
import 'package:packit/domain/entities/member_response.dart';
import 'package:packit/domain/entities/packit_login_entity.dart';
import 'package:packit/domain/entities/packit_refresh_entity.dart';
import 'package:packit/domain/entities/token_response.dart';
import 'package:packit/domain/enum/member_status_enum.dart';
import 'package:packit/domain/usecases/auth_use_cases.dart';
import 'package:packit/domain/usecases/member_use_cases.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  final AuthLocalDataSource _authLocalDataSource = AuthLocalDataSource();

  final AuthUseCases _authUseCases = Get.find<AuthUseCases>();
  final MemberUseCases _memberUseCases = Get.find<MemberUseCases>();

  PackitLoginEntity? _credential;
  MemberResponse? member;
  TokenResponse? token;

  @override
  void onInit() async {
    super.onInit();

    await getCredential();
    if (_credential != null) await login();
  }

  Future<void> getCredential() async {
    _credential = await _authLocalDataSource.getCredential();
  }

  Future<void> saveCredential(PackitLoginEntity credential) async {
    await _authLocalDataSource.saveCredential(credential);
    _credential = credential;
  }

  Future<void> login() async {
    try {
      LoginResponse response = (await _authUseCases.login.execute(_credential!)).data;
      token = TokenResponse(accessToken: response.accessToken, refreshToken: response.refreshToken);

      switch (response.memberStatus) {
        case MemberStatusEnum.active:
          member = (await _memberUseCases.getMemberProfile.execute()).data;

          if (member != null && token != null) {
            Get.offAllNamed(RoutePath.main);
          }
          break;
        case MemberStatusEnum.waitingToJoin:
          Get.toNamed(RoutePath.term);
          break;
        case MemberStatusEnum.delete:
          await logout();
          break;
      }
    } catch (e) {
      if (kDebugMode) print(e);
      await logout();
    }
  }

  Future<void> logout() async {
    await _authUseCases.logout.execute();
    await _authLocalDataSource.deleteCredential();
    _credential = null;
    member = null;
    token = null;
    Get.offAllNamed(RoutePath.login);
  }

  Future<void> refreshToken() async {
    try {
      if (token != null) {
        TokenResponse response = (await _authUseCases.refreshToken.execute(
          PackitRefreshEntity(expiredAccessToken: token!.accessToken, refreshToken: token!.refreshToken),
        ))
            .data;

        token = response;
      }
    } catch (e) {
      if (kDebugMode) print(e);
      rethrow;
    }
  }
}
