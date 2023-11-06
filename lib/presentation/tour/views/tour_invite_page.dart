import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:packit/presentation/tour/controller/tour_controller.dart';
import 'package:packit/presentation/widget/packit_button.dart';

class TourInvitePage extends StatelessWidget {
  const TourInvitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15.67.w, 19.h, 23.5.w, 0),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset('assets/icons/arrow_back.svg', width: 24.w, height: 24.h),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 14.76.h),
                  Text("일행을 초대해주세요!", style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700)),
                  SizedBox(height: 4.16.h),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: const Color(0xFF71757E)),
                      children: [
                        const TextSpan(text: "총 "),
                        TextSpan(
                            text: "${Get.find<TourController>().selectedPartyNumber.value.toString()}명",
                            style: const TextStyle(color: Color(0xFF0EA8FF))),
                        const TextSpan(text: "까지 초대가 가능합니다.\n동행자에게 초대코드를 공유해주세요"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 28.76.h),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: const Color(0xFF0AB6FF)),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 11.h),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/icons/tour/key.svg', width: 24.w, height: 24.w),
                      SizedBox(width: 3.w),
                      Text("초대코드 공유하기",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF0EA8FF),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 28.h),
            PackitButton("참여코드 공유하기", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
