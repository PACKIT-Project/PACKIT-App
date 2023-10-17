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
            SvgPicture.asset("assets/images/packit.svg", width: 169.98.w, height: 50.52.w),
            SizedBox(height: 5.71.w),
            Text(
              "빈틈없는 여행 준비, 패킷",
              style: TextStyle(fontSize: 18.53.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 115.51.w),
            SSOLoginButton(
              "카카오로 시작하기",
              iconName: "kakao",
              color: const Color(0xFFFEE500),
              onPressed: () {
                Navigator.pushNamed(context, RoutePath.onboarding);
              },
            ),
            SizedBox(height: 10.w),
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
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.6),
      elevation: 0,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40.w,
              height: 6.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(37),
                color: Colors.white.withOpacity(0.39),
              ),
            ),
            SizedBox(height: 9.w),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                color: Colors.white,
              ),
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 23.55.w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("다른 방법으로 시작하기", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700)),
                        SizedBox(width: 71.37.w),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.close, size: 24.w),
                        ),
                        SizedBox(width: 25.13.w),
                      ],
                    ),
                    SizedBox(height: 21.45.w),
                    SSOLoginButton(
                      "네이버로 시작하기",
                      iconName: "naver",
                      color: const Color(0xFF03C75A),
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                    SizedBox(height: 10.w),
                    SSOLoginButton(
                      "Apple로 시작하기",
                      iconName: "apple",
                      color: Colors.black,
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                    SizedBox(height: 56.w),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
