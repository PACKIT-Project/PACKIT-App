import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:packit/presentation/widget/packit_button.dart';

import '../controller/tour_controller.dart';

class SelectPartyPage extends StatelessWidget {
  const SelectPartyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15.67.w, 19.h, 23.5.w, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset('assets/icons/arrow_back.svg', width: 24.w, height: 24.h),
                  ),
                  Row(
                    children: [
                      Text("3", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: const Color(0xFF02B2FF))),
                      Text("/3", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: const Color(0xFF6B7684))),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.67.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const Text("여행 인원을\n선택해주세요", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700)),
            ),
            SizedBox(height: 38.7.h),
            const _SelectPartyWidget("혼자 떠나요!", icon: 'person.svg'),
            SizedBox(height: 12.h),
            const _SelectPartyWidget("여러명이서 떠나요!", icon: 'party.svg', isParty: true),
            const Spacer(),
            Center(child: PackitButton("다음", onTap: () {})),
            SizedBox(height: 28.69.h),
          ],
        ),
      ),
    );
  }
}

class _SelectPartyWidget extends GetView<TourController> {
  const _SelectPartyWidget(this.title, {required this.icon, this.isParty = false});

  final String title;
  final String icon;
  final bool isParty;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.5.w),
        child: GestureDetector(
          onTap: !isParty ? () => controller.selectedPartyNumber.value = 1 : () async => await showPartyModal(context),
          child: Container(
            height: 56.h,
            decoration: BoxDecoration(
                border: isParty
                    ? controller.selectedPartyNumber.value >= 2
                        ? Border.all(width: 2, color: const Color(0xFF0AB6FF))
                        : Border.all(width: 2, color: const Color(0xFFE9ECF0))
                    : controller.selectedPartyNumber.value == 1
                        ? Border.all(width: 2, color: const Color(0xFF0AB6FF))
                        : Border.all(width: 2, color: const Color(0xFFE9ECF0)),
                borderRadius: BorderRadius.circular(8.r),
                color: const Color(0xFFF7F9FC)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/tour/$icon', width: 24.w, height: 24.h),
                SizedBox(width: 10.w),
                Text(
                  title,
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: const Color(0xFF404244)),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

Future<dynamic> showPartyModal(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    barrierColor: Colors.black.withOpacity(0.39),
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
    ),
    builder: (context) {
      return SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10.11.h),
              Container(
                width: 40.w,
                height: 4.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(37),
                  color: const Color(0xFFD6D6D6).withOpacity(0.39),
                ),
              ),
              SizedBox(height: 14.13.h),
              Text("인원 선택", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700)),
              Text("인원은 최대 8명까지 초대 가능합니다",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xB2000000),
                  )),
              SizedBox(height: 19.43.h),
              GetX<TourController>(builder: (controller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {
                        if (controller.modalPartyNumber.value > 2) controller.modalPartyNumber.value--;
                      },
                      child: Padding(
                        padding: EdgeInsets.all(6.w),
                        child: SvgPicture.asset('assets/icons/tour/minus.svg', width: 36.w, height: 36.h),
                      ),
                    ),
                    SizedBox(width: 35.w),
                    Text(
                      controller.modalPartyNumber.value.toString(),
                      style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.w700, color: const Color(0xFF0EA8FF)),
                    ),
                    SizedBox(width: 35.w),
                    InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {
                        if (controller.modalPartyNumber.value < 8) controller.modalPartyNumber.value++;
                      },
                      child: Padding(
                        padding: EdgeInsets.all(6.w),
                        child: SvgPicture.asset('assets/icons/tour/plus.svg', width: 36.w, height: 36.h),
                      ),
                    ),
                  ],
                );
              }),
              SizedBox(height: 32.h),
              PackitButton("선택", onTap: () {
                Get.back();
                Get.find<TourController>().selectedPartyNumber.value = Get.find<TourController>().modalPartyNumber.value;
              }),
              SizedBox(height: 6.34.h),
            ],
          ),
        ),
      );
    },
  );
}
