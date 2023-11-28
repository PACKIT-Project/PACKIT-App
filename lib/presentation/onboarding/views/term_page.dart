import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/presentation/onboarding/controller/onboarding_controller.dart';
import 'package:packit/presentation/widget/packit_appbar.dart';
import 'package:packit/presentation/widget/packit_button.dart';
import 'package:packit/presentation/widget/packit_checkbox.dart';

class TermPage extends GetView<OnboardingController> {
  const TermPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PackitAppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 11.64.w),
            Padding(
              padding: EdgeInsets.only(left: 25.w),
              child: Text(
                "서비스 이용을 위해\n이용약관 동의가 필요합니다.",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700, color: AppColor.coolGray400),
              ),
            ),
            SizedBox(height: 64.3.w),
            Padding(
              padding: EdgeInsets.only(left: 25.w),
              child: GestureDetector(
                onTap: () => controller.setAllChecked(),
                child: Row(
                  children: [
                    Obx(() => PackitCheckBox(value: controller.isAllChecked, onChanged: (_) => controller.setAllChecked())),
                    SizedBox(width: 11.w),
                    Text(
                      "전체 동의",
                      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, color: AppColor.coolGray500),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 19.47.w),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const Divider(height: 1, thickness: 1, color: AppColor.gray2),
            ),
            SizedBox(height: 18.73.w),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => controller.isPrivacyChecked.value = !controller.isPrivacyChecked.value,
                    child: Row(
                      children: [
                        Obx(
                          () => PackitCheck(
                              value: controller.isPrivacyChecked.value, onChanged: (value) => controller.isPrivacyChecked.value = value!),
                        ),
                        SizedBox(width: 9.w),
                        Text("(필수) 개인정보처리방침", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: AppColor.coolGray500)),
                        const Spacer(),
                        SvgPicture.asset('assets/icons/navigate_next.svg', width: 24.w, height: 24.w),
                      ],
                    ),
                  ),
                  SizedBox(height: 17.w),
                  GestureDetector(
                    onTap: () => controller.isTermChecked.value = !controller.isTermChecked.value,
                    child: Row(
                      children: [
                        Obx(
                          () => PackitCheck(
                              value: controller.isTermChecked.value, onChanged: (value) => controller.isTermChecked.value = value!),
                        ),
                        SizedBox(width: 9.w),
                        Text("(필수) 서비스 이용약관", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: AppColor.coolGray500)),
                        const Spacer(),
                        SvgPicture.asset('assets/icons/navigate_next.svg', width: 24.w, height: 24.w),
                      ],
                    ),
                  ),
                  SizedBox(height: 17.w),
                  GestureDetector(
                    onTap: () => controller.isPushChecked.value = !controller.isPushChecked.value,
                    child: Row(
                      children: [
                        Obx(
                          () => PackitCheck(
                              value: controller.isPushChecked.value, onChanged: (value) => controller.isPushChecked.value = value!),
                        ),
                        SizedBox(width: 9.w),
                        Text("(선택) 푸시 알림 동의", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: AppColor.coolGray500)),
                        const Spacer(),
                        SvgPicture.asset('assets/icons/navigate_next.svg', width: 24.w, height: 24.w),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Obx(() => PackitButton("시작하기", onTap: controller.isRequiredChecked ? () => Get.toNamed(RoutePath.setProfile) : null)),
            SizedBox(height: 28.w),
          ],
        ),
      ),
    );
  }
}
