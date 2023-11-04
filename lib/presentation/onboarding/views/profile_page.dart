import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:packit/app/config/routes/route_path.dart';

import '../controller/profile_controller.dart';

class SetProfilePage extends StatelessWidget {
  const SetProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.33.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.81.w),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset('assets/icons/arrow_back.svg', width: 24.w, height: 24.h),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12.27.h),
                    Text("프로필 설정하기", style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w700)),
                    SizedBox(height: 5.33.h),
                    Text(
                      "서비스 이용에 사용하실 프로필 사진과\n여행자 이름을 입력해주세요",
                      style: TextStyle(color: const Color(0xFF6F727A), fontSize: 18.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 55.04.h),
                    Center(
                      child: Stack(
                        children: [
                          Image.asset("assets/images/avatar_placeholder.png", width: 100.w, height: 100.w),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                width: 23.4.w,
                                height: 23.4.h,
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
                    SizedBox(height: 32.77.h),
                    const _NickNameTextField(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GetX<ProfileController>(
        builder: (controller) {
          return Padding(
            padding: !controller.isFocus.value || MediaQuery.of(context).viewInsets.bottom == 0
                ? EdgeInsets.fromLTRB(25.w, 16.35.w, 25.w, MediaQuery.of(context).viewInsets.bottom + 45.68.w)
                : EdgeInsets.fromLTRB(25.w, 16.35.w, 25.w, MediaQuery.of(context).viewInsets.bottom + 16.35.w),
            child: GestureDetector(
              onTap: () => Get.toNamed(RoutePath.selectDate),
              child: Container(
                width: 340.w,
                height: 50.h,
                decoration: BoxDecoration(color: const Color(0xFF0AB6FF), borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text("프로필 만들기", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, color: Colors.white)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _NickNameTextField extends GetView<ProfileController> {
  const _NickNameTextField();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FocusScope(
            child: Focus(
              onFocusChange: (value) => controller.isFocus.value = value,
              child: TextField(
                controller: controller.nickNameTextController,
                focusNode: controller.nickNameTextFocus,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                scrollPadding: const EdgeInsets.only(bottom: 150),
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.only(bottom: 4.29.h),
                    hintText: " 닉네임을 입력해주세요",
                    hintStyle: TextStyle(color: const Color(0xFFC6CED8), fontSize: 20.sp, fontWeight: FontWeight.w500),
                    enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFC6CED8))),
                    focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFC6CED8))),
                    suffix: SvgPicture.asset('assets/icons/check.svg', width: 24.w, height: 24.h)),
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
          SizedBox(height: 7.02.h),
          Text("사용할 수 있는 이름이에요.", style: TextStyle(color: const Color(0xFF119BFF), fontSize: 16.sp, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
