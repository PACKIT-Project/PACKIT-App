import 'package:defer_pointer/defer_pointer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:packit/app/config/app_typeface.dart';
import 'package:packit/presentation/widget/packit_bottom_sheet.dart';

import '../controller/main_controller.dart';

class PackitBottomNavBar extends StatelessWidget {
  const PackitBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DeferredPointerHandler(
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            top: -120.w,
            right: 16.w,
            child: const Align(
              alignment: Alignment.topRight,
              child: _AddTourToolTip(),
            ),
          ),
          Positioned.fill(
            top: -30,
            right: 26,
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x14000000),
                      blurRadius: 17,
                      offset: Offset(0, 1.85),
                      spreadRadius: 0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).padding.bottom + 50.w,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 17,
                  offset: Offset(0, 1.85),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 38.77.w, bottom: MediaQuery.of(context).padding.bottom),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const _BottomNavBarItem(label: '홈', icon: 'home', index: 0),
                  SizedBox(width: 46.w),
                  const _BottomNavBarItem(label: '피드', icon: 'map', index: 1),
                  SizedBox(width: 46.w),
                  const _BottomNavBarItem(label: '내 여행', icon: 'user', index: 2),
                ],
              ),
            ),
          ),
          Positioned.fill(
            top: -30,
            right: 26,
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Center(
                  child: DeferPointer(
                    child: GestureDetector(
                      onTap: () async => await showPackitBottomSheet(context, PackitBottomSheetType.travelAdd),
                      child: Container(
                        width: 66,
                        height: 66,
                        decoration: const BoxDecoration(color: AppColor.mainBlue, shape: BoxShape.circle, boxShadow: [
                          BoxShadow(
                            color: Color(0x14000000),
                            blurRadius: 7.42,
                            offset: Offset(0, 1.85),
                            spreadRadius: 0,
                          )
                        ]),
                        child: Center(child: SvgPicture.asset('assets/icons/home/add.svg', width: 36, height: 36, fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavBarItem extends GetView<MainController> {
  const _BottomNavBarItem({required this.label, required this.icon, required this.index});

  final String label;
  final String icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => controller.changeCurrentIndex(index),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/icons/home/$icon.svg',
                width: 24.w,
                height: 24.w,
                colorFilter: ColorFilter.mode(controller.currentIndex == index ? AppColor.coolGray200 : AppColor.gray3, BlendMode.srcIn),
              ),
              SizedBox(height: 4.h),
              Text(
                label,
                style: AppTypeFace.to.caption3Semibold.copyWith(
                  color: controller.currentIndex == index ? AppColor.coolGray200 : AppColor.gray3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddTourToolTip extends StatelessWidget {
  const _AddTourToolTip();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/tooltip_bubble.png',
          width: 254.w,
          height: 84.92094.h,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: EdgeInsets.only(left: 14.w),
          child: SizedBox(
            height: 76.81094.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("✈️ 새로운 여행을 추가해보세요", style: AppTypeFace.to.body4SemiBold),
                SizedBox(height: 5.h),
                Text(
                  "계획한 여행을 추가하고 혼자 혹은 최대 8명까지\n함께 여행을 준비할 수 있습니다.",
                  style: AppTypeFace.to.caption2Medium.copyWith(color: AppColor.coolGray200),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
