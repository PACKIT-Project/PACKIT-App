import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:packit/presentation/authentication/controller/login_controller.dart';

import '../widget/sso_login_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/packit.svg", width: 210.12.w, height: 54.27.w),
            SizedBox(height: 17.16.h),
            Text(
              "빈틈없는 여행 준비의 시작",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500, color: AppColor.coolGray300),
            ),
            SizedBox(height: 117.31.h),
            SSOLoginButton(
              "카카오로 시작하기",
              iconName: "kakao",
              color: const Color(0xFFFEE500),
              onPressed: () async => LoginController.to.loginWithKakao(),
            ),
            SizedBox(height: 10.h),
            SSOLoginButton(
              "네이버로 시작하기",
              iconName: "naver",
              color: const Color(0xFF03C75A),
              textColor: Colors.white,
              onPressed: () {},
            ),
            SizedBox(height: 10.h),
            SSOLoginButton(
              "Apple로 시작하기",
              iconName: "apple",
              color: Colors.black,
              textColor: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
