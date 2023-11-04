import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:packit/app/config/routes/route_path.dart';

import '../widget/delayed_animation.dart';
import '../widget/packit_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CarouselSlider.builder(
                itemCount: 3,
                slideBuilder: (int index) {
                  if (index == 0) {
                    return const OnboardingMessage0Widget();
                  } else if (index == 1) {
                    return const OnboardingMessage1Widget();
                  } else {
                    return const OnboardingMessage2Widget();
                  }
                },
                slideIndicator: CircularSlideIndicator(
                  indicatorRadius: 5,
                  currentIndicatorColor: const Color(0xFF0AB6FF),
                  indicatorBackgroundColor: const Color(0xFFD9D9D9),
                ),
              ),
            ),
            SizedBox(height: 158.69.h),
            PackitButton("시작하기", onTap: () => Navigator.pushNamed(context, RoutePath.setProfile)),
            SizedBox(height: 27.69.h),
          ],
        ),
      ),
    );
  }
}

class OnboardingMessage0Widget extends StatelessWidget {
  const OnboardingMessage0Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 161.27.h),
          DelayedAnimation(
            delay: 500,
            child: Row(
              children: [
                Text(
                  "빈틈없는",
                  style: TextStyle(fontSize: 46.83.sp, fontWeight: FontWeight.w800, color: const Color(0xFF071A49)),
                ),
                SizedBox(width: 11.w),
                SvgPicture.asset('assets/icons/onboarding/clock.svg', width: 50.w, height: 50.w),
              ],
            ),
          ),
          SizedBox(height: 5.4.h),
          DelayedAnimation(
            delay: 1000,
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/onboarding/parasol.svg', width: 50.w, height: 50.w),
                SizedBox(width: 11.w),
                Text(
                  "여행의 시작",
                  style: TextStyle(fontSize: 46.83.sp, fontWeight: FontWeight.w900, color: const Color(0xFF071A49)),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.4.h),
          DelayedAnimation(
            delay: 1500,
            child: Text("EASY", style: TextStyle(fontSize: 46.sp, fontWeight: FontWeight.w900, color: const Color(0xFF0A98FF))),
          ),
          SizedBox(height: 2.4.h),
          DelayedAnimation(
            delay: 2000,
            child: Row(
              children: [
                Text(
                  "TRIP PREP",
                  style: TextStyle(fontSize: 46.sp, fontWeight: FontWeight.w900, color: const Color(0xFF0A98FF)),
                ),
                SizedBox(width: 9.w),
                SvgPicture.asset('assets/icons/onboarding/plane.svg', width: 50.w, height: 50.w),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingMessage1Widget extends StatelessWidget {
  const OnboardingMessage1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 161.27.h),
          DelayedAnimation(
            delay: 500,
            child: Row(
              children: [
                Text(
                  "동행자와",
                  style: TextStyle(fontSize: 46.83.sp, fontWeight: FontWeight.w800, color: const Color(0xFF071A49)),
                ),
                SizedBox(width: 11.w),
                SvgPicture.asset('assets/icons/onboarding/handshake.svg', width: 50.w, height: 50.w),
              ],
            ),
          ),
          SizedBox(height: 5.4.h),
          DelayedAnimation(
            delay: 1000,
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/onboarding/memo.svg', width: 50.w, height: 50.w),
                SizedBox(width: 11.w),
                Text(
                  "함께 만드는",
                  style: TextStyle(fontSize: 46.83.sp, fontWeight: FontWeight.w900, color: const Color(0xFF071A49)),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.4.h),
          DelayedAnimation(
            delay: 1500,
            child: Text("GROUP", style: TextStyle(fontSize: 46.sp, fontWeight: FontWeight.w900, color: const Color(0xFF0A98FF))),
          ),
          SizedBox(height: 2.4.h),
          DelayedAnimation(
            delay: 2000,
            child: Row(
              children: [
                Text(
                  "CHECKLIST",
                  style: TextStyle(fontSize: 46.sp, fontWeight: FontWeight.w900, color: const Color(0xFF0A98FF)),
                ),
                SizedBox(width: 9.w),
                SvgPicture.asset('assets/icons/onboarding/sign.svg', width: 50.w, height: 50.w),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingMessage2Widget extends StatelessWidget {
  const OnboardingMessage2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 161.27.h),
          DelayedAnimation(
            delay: 500,
            child: Row(
              children: [
                Text(
                  "실시간",
                  style: TextStyle(fontSize: 46.83.sp, fontWeight: FontWeight.w800, color: const Color(0xFF071A49)),
                ),
                SizedBox(width: 11.w),
                SvgPicture.asset('assets/icons/onboarding/search.svg', width: 50.w, height: 50.w),
              ],
            ),
          ),
          SizedBox(height: 5.4.h),
          DelayedAnimation(
            delay: 1000,
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/onboarding/idea.svg', width: 50.w, height: 50.w),
                SizedBox(width: 11.w),
                Text(
                  "여행지 정보",
                  style: TextStyle(fontSize: 46.83.sp, fontWeight: FontWeight.w900, color: const Color(0xFF071A49)),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.4.h),
          DelayedAnimation(
            delay: 1500,
            child: Text("LIVE", style: TextStyle(fontSize: 46.83.sp, fontWeight: FontWeight.w900, color: const Color(0xFF0A98FF))),
          ),
          SizedBox(height: 2.4.h),
          DelayedAnimation(
            delay: 2000,
            child: Row(
              children: [
                Text(
                  "INSIGHT",
                  style: TextStyle(fontSize: 46.83.sp, fontWeight: FontWeight.w900, color: const Color(0xFF0A98FF)),
                ),
                SizedBox(width: 9.w),
                SvgPicture.asset('assets/icons/onboarding/notice.svg', width: 50.w, height: 50.w),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
