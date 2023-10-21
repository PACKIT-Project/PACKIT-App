import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/presentation/authentication/controller/onboarding_controller.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back_ios, size: 20.w),
                ),
                SizedBox(height: 41.78.w),
                Text("프로필 설정하기", style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w700)),
                SizedBox(height: 7.22.w),
                Text(
                  "다른 여행자들에게\n공개되는 프로필입니다",
                  style: TextStyle(color: const Color(0xFF727272), fontSize: 18.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 46.21.w),
                Center(
                  child: Stack(
                    children: [
                      Image.asset("assets/images/avatar_placeholder.png", width: 99.w, height: 99.w),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 23.4.w,
                            height: 23.4.w,
                            decoration: const ShapeDecoration(
                              color: Colors.white,
                              shape: OvalBorder(),
                              shadows: [BoxShadow(color: Color(0x23000000), blurRadius: 3.60, offset: Offset(0, 0), spreadRadius: 0)],
                            ),
                            child: Icon(Icons.camera_alt, color: const Color(0xFF536073), size: 12.6.w),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 36.39.w),
                const _NickNameTextField(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GetX<OnboardingController>(
        builder: (controller) {
          return Padding(
            padding: !controller.isFocus.value || MediaQuery.of(context).viewInsets.bottom == 0
                ? EdgeInsets.fromLTRB(25.w, 16.35.w, 25.w, MediaQuery.of(context).viewInsets.bottom + 45.68.w)
                : EdgeInsets.fromLTRB(25.w, 16.35.w, 25.w, MediaQuery.of(context).viewInsets.bottom + 16.35.w),
            child: GestureDetector(
              onTap: () => Get.toNamed(RoutePath.selectDate),
              child: Container(
                width: 340.w,
                height: 50.w,
                decoration: BoxDecoration(color: const Color(0xFF0094FF), borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text("완료", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.white)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _NickNameTextField extends GetView<OnboardingController> {
  const _NickNameTextField();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          FocusScope(
            child: Focus(
              onFocusChange: (value) => controller.isFocus.value = value,
              child: TextField(
                controller: controller.nickNameTextController,
                focusNode: controller.nickNameTextFocus,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                scrollPadding: const EdgeInsets.only(bottom: 150),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.only(bottom: 10.22.w),
                  hintText: "여행자 닉네임을 입력해주세요",
                  hintStyle: TextStyle(color: const Color(0xFFC6CED8), fontSize: 18.sp, fontWeight: FontWeight.w600),
                  enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFE9ECF0))),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: const Color(0xFF119BFF), width: 1.5.w)),
                ),
                onChanged: (value) {
                  if (value.isEmpty) {
                    controller.isNickEmpty.value = true;
                  } else {
                    controller.isNickEmpty.value = false;
                  }
                },
              ),
            ),
          ),
          SizedBox(height: 11.5.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/icons/check.svg", width: 14.w, height: 14.w),
                  SizedBox(width: 4.w),
                  Text("닉네임 중복확인이 완료되었습니다.",
                      style: TextStyle(color: const Color(0xFF05C983), fontSize: 12.sp, fontWeight: FontWeight.w600)),
                ],
              ),
              Obx(
                () => GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 72.w,
                    height: 26.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: controller.isNickEmpty.value ? const Color(0xFF60BCFF) : const Color(0xFF0094FF),
                    ),
                    child: Center(
                      child: Text("중복확인", style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
