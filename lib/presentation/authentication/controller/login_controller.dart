import 'package:flutter/foundation.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

enum SSOType { kakao, naver, apple }

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  Future<void> login(SSOType ssoType) async {
    if (ssoType == SSOType.kakao) {
      await _loginWithKakao();
    } else if (ssoType == SSOType.naver) {
      await _loginWithNaver();
    } else if (ssoType == SSOType.apple) {
      await _loginWithApple();
    }
  }

  Future<void> _loginWithKakao() async {
    User user;

    try {
      if (await isKakaoTalkInstalled()) {
        await UserApi.instance.loginWithKakaoTalk();
      } else {
        await UserApi.instance.loginWithKakaoAccount();
      }

      user = await UserApi.instance.me();

      if (kDebugMode) print(user);
    } catch (e) {
      if (kDebugMode) print('카카오 로그인 실패: $e');
    }
  }

  Future<void> _loginWithNaver() async {
    try {
      NaverLoginResult result = await FlutterNaverLogin.logIn();
      if (kDebugMode) print(result);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _loginWithApple() async {
    AuthorizationCredentialAppleID credential;

    try {
      credential = await SignInWithApple.getAppleIDCredential(scopes: []);

      if (kDebugMode) print(credential);
    } catch (e) {
      if (kDebugMode) print('애플 로그인 실패: $e');
    }
  }
}
