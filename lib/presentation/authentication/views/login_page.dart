import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:packit/app/config/routes/route_path.dart';

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
            SvgPicture.asset("assets/images/packit.svg", width: 211.12405.w, height: 54.27002.h),
            SizedBox(height: 17.16.h),
            Text(
              "함께하는 여행 준비의 시작",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 115.51.h),
            SSOLoginButton(
              "카카오로 시작하기",
              iconName: "kakao",
              color: const Color(0xFFFEE500),
              onPressed: () {
                Navigator.pushNamed(context, RoutePath.setProfile);
              },
            ),
            SizedBox(height: 10.h),
            SSOLoginButton(
              "다른 방법으로 시작하기",
              border: Border.all(color: const Color(0xFFBBC1C6), width: 0.8.w),
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
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.3),
      elevation: 0,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 28.h),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10.28.w),
                  Container(
                    width: 40.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(37),
                      color: const Color(0x63D6D6D6),
                    ),
                  ),
                  SizedBox(height: 19.36.h),
                  Text("다른 방법으로 시작하기", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
                  SizedBox(height: 21.36.h),
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
                  SizedBox(height: 33.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
