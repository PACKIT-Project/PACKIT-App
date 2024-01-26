import 'package:flutter/foundation.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/app/service/auth_service.dart';
import 'package:packit/domain/entities/login_response.dart';
import 'package:packit/domain/entities/packit_login_entity.dart';
import 'package:packit/domain/enum/member_status_enum.dart';
import 'package:packit/domain/usecases/auth_use_cases.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

enum SSOType { kakao, naver, apple }

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  final AuthUseCases authUseCases = Get.find<AuthUseCases>();

  Future<void> login(SSOType ssoType) async {
    PackitLoginEntity? loginEntity;

    if (ssoType == SSOType.kakao) {
      loginEntity = await _loginWithKakao();
    } else if (ssoType == SSOType.naver) {
      loginEntity = await _loginWithNaver();
    } else if (ssoType == SSOType.apple) {
      loginEntity = await _loginWithApple();
    }

    if (loginEntity != null) {
      LoginResponse response = await authUseCases.login.execute(loginEntity);

      switch (response.data.memberStatus) {
        case MemberStatusEnum.active:
          break;
        case MemberStatusEnum.waitingToJoin:
          AuthService.to.loginResponse = response;
          Get.toNamed(RoutePath.term);
          break;
        case MemberStatusEnum.delete:
          break;
      }
    }
  }

  Future<PackitLoginEntity?> _loginWithKakao() async {
    User user;

    try {
      if (await isKakaoTalkInstalled()) {
        await UserApi.instance.loginWithKakaoTalk();
      } else {
        await UserApi.instance.loginWithKakaoAccount();
      }

      user = await UserApi.instance.me();

      if (kDebugMode) print(user);

      return PackitLoginEntity(loginProvider: SSOType.kakao.name, memberPersonalId: user.id.toString());
    } catch (e) {
      if (kDebugMode) print('카카오 로그인 실패: $e');
    }

    return null;
  }

  Future<PackitLoginEntity?> _loginWithNaver() async {
    try {
      NaverLoginResult result = await FlutterNaverLogin.logIn();

      if (kDebugMode) print(result);

      return PackitLoginEntity(loginProvider: SSOType.naver.name, memberPersonalId: result.account.id);
    } catch (e) {
      if (kDebugMode) print(e);
    }

    return null;
  }

  Future<PackitLoginEntity?> _loginWithApple() async {
    AuthorizationCredentialAppleID credential;

    try {
      credential = await SignInWithApple.getAppleIDCredential(scopes: []);

      if (kDebugMode) print(credential);

      return PackitLoginEntity(loginProvider: SSOType.apple.name, memberPersonalId: credential.userIdentifier!);
    } catch (e) {
      if (kDebugMode) print('애플 로그인 실패: $e');
    }

    return null;
  }
}
