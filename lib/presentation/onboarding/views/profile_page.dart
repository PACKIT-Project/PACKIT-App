import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/app/extension/input_validate.dart';
import 'package:packit/presentation/widget/packit_button.dart';

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
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.81.w),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset('assets/icons/arrow_back.svg', width: 24.w, height: 24.h),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12.27.h),
                    Text("회원가입", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: const Color(0xCC9299A1))),
                    SizedBox(height: 5.31.h),
                    Text(
                      "닉네임을 입력해주세요",
                      style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 87.31.h),
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
            child: PackitButton(
              "프로필 만들기",
              onTap: controller.isNickValid.value ? () => Get.toNamed(RoutePath.selectDate) : null,
              color: controller.isNickValid.value ? const Color(0xFF02B2FF) : const Color(0xFFBFEBFF),
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
    return Obx(
      () {
        return Column(
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
                    hintText: "닉네임을 입력해주세요",
                    hintStyle: TextStyle(color: const Color(0xFFABB4BF), fontSize: 20.sp, fontWeight: FontWeight.w500),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: controller.isValidatorEnable.value
                          ? controller.isNickValid.value
                              ? const BorderSide(color: Color(0xFF02B2FF), width: 1.5)
                              : const BorderSide(color: Color(0xFFFF3049), width: 1.5)
                          : const BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: controller.isValidatorEnable.value
                          ? controller.isNickValid.value
                              ? const BorderSide(color: Color(0xFF02B2FF), width: 1.5)
                              : const BorderSide(color: Color(0xFFFF3049), width: 1.5)
                          : const BorderSide(color: Colors.black),
                    ),
                    suffix: controller.isValidatorEnable.value
                        ? controller.isNickValid.value
                            ? SvgPicture.asset('assets/icons/check.svg', width: 24.w, height: 24.h)
                            : SvgPicture.asset('assets/icons/error.svg', width: 24.w, height: 24.h)
                        : const SizedBox(),
                  ),
                  onChanged: (value) {
                    if (value.length >= 2) {
                      controller.isValidatorEnable.value = true;
                      controller.isNickValid.value = controller.nickNameTextController.text.isValidNick();
                    } else {
                      controller.isValidatorEnable.value = false;
                      controller.isNickValid.value = false;
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 11.h),
            Text("2~13자의 한글, 영문, 숫자, -, _ 조합 사용 가능", style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600)),
            SizedBox(height: 7.58.h),
            if (controller.isValidatorEnable.value && controller.isNickValid.value) ...[
              Text("사용할 수 있는 닉네임입니다.", style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, color: const Color(0xFF02B2FF))),
            ] else if (controller.isValidatorEnable.value && !controller.isNickValid.value) ...[
              Text("닉네임을 확인해주세요.", style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, color: const Color(0xFFFF3049))),
            ]
          ],
        );
      },
    );
  }
}
