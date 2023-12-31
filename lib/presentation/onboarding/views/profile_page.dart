import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/app/extension/input_validate.dart';
import 'package:packit/presentation/widget/packit_appbar.dart';
import 'package:packit/presentation/widget/packit_button.dart';

import '../controller/onboarding_controller.dart';

class SetProfilePage extends StatelessWidget {
  const SetProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PackitAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 11.64.w),
                Text(
                  "사용하실 닉네임을\n입력해주세요",
                  style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 89.77.w),
                Center(
                  child: Stack(
                    children: [
                      Image.asset("assets/images/avatar_placeholder.png", width: 100.w, height: 100.w),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 25.35.w,
                            height: 25.35.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: AppColor.gray2,
                              ),
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.camera_alt, color: const Color(0xFF536073), size: 14.w),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.77.w),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: const _NickNameTextField(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: GetX<OnboardingController>(
          builder: (controller) {
            return Padding(
              padding: !controller.isFocus.value || MediaQuery.of(context).viewInsets.bottom == 0
                  ? EdgeInsets.only(top: 16.35.w, bottom: MediaQuery.of(context).viewInsets.bottom + 28.w)
                  : EdgeInsets.only(top: 16.35.w, bottom: MediaQuery.of(context).viewInsets.bottom + 28.w),
              child: PackitButton(
                "프로필 만들기",
                onTap: controller.isNickValid.value ? () => Get.toNamed(RoutePath.selectRegion) : null,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _NickNameTextField extends GetView<OnboardingController> {
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
                  focusNode: controller.textFieldFocus,
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: AppColor.coolGray500),
                  scrollPadding: const EdgeInsets.only(bottom: 150),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.w),
                    hintText: "닉네임을 입력해주세요",
                    hintStyle: TextStyle(color: AppColor.gray4, fontSize: 18.sp, fontWeight: FontWeight.w500),
                    filled: true,
                    fillColor: AppColor.gray1,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: controller.isValidatorEnable.value
                          ? controller.isNickValid.value
                              ? const BorderSide(color: Color(0xFF02B2FF), width: 1.5)
                              : const BorderSide(color: Color(0xFFFF3049), width: 1.5)
                          : const BorderSide(color: AppColor.coolGray300, width: 1.5),
                    ),
                    suffixIcon: controller.isValidatorEnable.value
                        ? controller.isNickValid.value
                            ? Row(
                                children: [
                                  SvgPicture.asset('assets/icons/correct.svg', width: 24.w, height: 24.w),
                                  SizedBox(width: 11.3.w),
                                ],
                              )
                            : Row(
                                children: [
                                  SvgPicture.asset('assets/icons/error.svg', width: 24.w, height: 24.w),
                                  SizedBox(width: 11.3.w),
                                ],
                              )
                        : const SizedBox(),
                    suffixIconConstraints: BoxConstraints(maxWidth: 35.3.w, maxHeight: 24.w),
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
            SizedBox(height: 11.w),
            Text(
              "2~13자의 한글, 영문, 숫자, -, _ 조합 사용 가능",
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600, color: AppColor.coolGray100),
            ),
            SizedBox(height: 8.w),
            if (controller.isValidatorEnable.value && controller.isNickValid.value) ...[
              Text("사용할 수 있는 닉네임입니다.", style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600, color: AppColor.mainBlue)),
            ] else if (controller.isValidatorEnable.value && !controller.isNickValid.value) ...[
              Text("닉네임을 확인해주세요.", style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600, color: AppColor.alert)),
            ]
          ],
        );
      },
    );
  }
}
