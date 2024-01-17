import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

enum SSOType { kakao, naver, apple }

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  Future<void> login(SSOType ssoType) async {
    if (ssoType == SSOType.kakao) {
    } else if (ssoType == SSOType.naver) {
    } else if (ssoType == SSOType.apple) {}
  }

  Future<void> loginWithKakao() async {
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

  Future<void> loginWithNaver() async {
    // TODO : Implement login with Naver
  }

  Future<void> loginWithApple() async {
    // TODO : Implement login with Apple
  }
}
