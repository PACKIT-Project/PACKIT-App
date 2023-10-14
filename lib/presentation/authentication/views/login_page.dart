import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
            SvgPicture.asset("assets/images/packit.svg", width: 169.98.w, height: 50.52.h),
            SizedBox(height: 5.71.h),
            Text(
              "빈틈없는 여행 준비, 패킷",
              style: TextStyle(fontSize: 18.53.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 115.51.h),
            SSOLoginButton(
              "카카오로 로그인",
              iconName: "kakao",
              color: const Color(0xFFFEE500),
              onPressed: () {},
            ),
            SizedBox(height: 10.h),
            SSOLoginButton(
              "다른 방법으로 시작하기",
              border: Border.all(color: const Color(0xFF6C747C), width: 0.8.w),
              color: Colors.white,
              onPressed: () async => showAnotherLoginMethodModal(context),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showAnotherLoginMethodModal(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        barrierColor: Colors.black.withOpacity(0.4),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        builder: (context) {
          return SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 23.55.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("다른 방법으로 로그인", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700)),
                    SizedBox(width: 71.37.w),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.close, size: 24.w),
                    ),
                    SizedBox(width: 25.13.w),
                  ],
                ),
                SizedBox(height: 21.45.h),
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
                SizedBox(height: 56.h),
              ],
            ),
          );
        });
  }
}
