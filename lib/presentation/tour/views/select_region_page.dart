import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/presentation/widget/packit_button.dart';

import '../controller/tour_controller.dart';

class SelectRegionPage extends GetView<TourController> {
  const SelectRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15.67.w, 19.h, 23.5.w, 12.08.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset('assets/icons/arrow_back.svg', width: 24.w, height: 24.h),
                  ),
                  Row(
                    children: [
                      Text("1", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: const Color(0xFF02B2FF))),
                      Text("/3", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: const Color(0xFF6B7684))),
                    ],
                  ),
                ],
              ),
            ),
            Obx(() {
              if (controller.selectedRegion.value.isEmpty) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "여행 예정인 지역을\n선택해주세요",
                    style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700, color: const Color(0xFF232527)),
                  ),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "선택한 여행지를\n확인해주세요",
                    style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700, color: const Color(0xFF232527)),
                  ),
                );
              }
            }),
            const _RegionTextField(),
            const _SelectedRegionWidget(),
            const Stack(
              children: [
                _LatestSearchWidget(),
                _SearchResultWidget(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: GetX<TourController>(
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 28.69.h),
              child: PackitButton(
                "다음",
                onTap: controller.selectedRegion.value.isNotEmpty ? () => Get.toNamed(RoutePath.selectDate) : null,
                color: controller.selectedRegion.value.isNotEmpty ? null : const Color(0xFFBFEBFF),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _RegionTextField extends GetView<TourController> {
  const _RegionTextField();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.selectedRegion.value.isNotEmpty) return const SizedBox();

      return Padding(
        padding: EdgeInsets.fromLTRB(25.5.w, 48.28.h, 25.5.w, 0),
        child: FocusScope(
          child: Focus(
            onFocusChange: (value) => controller.isFocus.value = value,
            child: TextField(
              controller: controller.regionTextController,
              focusNode: controller.textFieldFocus,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              scrollPadding: const EdgeInsets.only(bottom: 150),
              decoration: InputDecoration(
                isDense: true,
                hintText: "어디로 여행을 떠나시나요?",
                hintStyle: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500, color: const Color(0xFFB9BFC7)),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Icon(
                    Icons.search,
                    size: 24.w,
                    color: controller.isRegionExist.value ? Colors.black : const Color(0xFFB9BFC7),
                  ),
                ),
                suffixIconConstraints: BoxConstraints(maxHeight: 24.h, maxWidth: 32.w),
              ),
              onChanged: (value) {
                if (value.isEmpty) {
                  controller.isRegionExist.value = false;
                  controller.update();
                } else {
                  controller.isRegionExist.value = true;
                  controller.update();
                }
              },
            ),
          ),
        ),
      );
    });
  }
}

class _SelectedRegionWidget extends GetView<TourController> {
  const _SelectedRegionWidget();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.selectedRegion.value.isEmpty) return const SizedBox();

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.5.w, vertical: 33.92.h),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: const Color(0xFF0EA8FF)),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 11.5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("도쿄", style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600)),
                    Text("일본", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: const Color(0xFF7C8792))),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    controller.selectedRegion.value = "";
                    controller.textFieldFocus.requestFocus();
                  },
                  child: Icon(Icons.cancel, size: 18.w, color: const Color(0xFF3B3B3B)),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class _LatestSearchWidget extends GetView<TourController> {
  const _LatestSearchWidget();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isRegionExist.value) return const SizedBox();

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.04.w, vertical: 39.84.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("최근 검색어", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
            SizedBox(height: 10.94.h),
            Wrap(
              spacing: 6.36.w,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.regionTextController.text = "도쿄";
                    controller.isRegionExist.value = true;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.2, color: const Color(0xFFE4E9EF)),
                        borderRadius: BorderRadius.circular(6.r),
                        color: const Color(0xFFF4F6F9)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                      child: Text("도쿄", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.2, color: const Color(0xFFE4E9EF)),
                      borderRadius: BorderRadius.circular(6.r),
                      color: const Color(0xFFF4F6F9)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                    child: Text("베를린", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

class _SearchResultWidget extends GetView<TourController> {
  const _SearchResultWidget();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isRegionExist.value && controller.selectedRegion.value.isEmpty) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.08.w, vertical: 8.93.h),
            child: SizedBox(
              width: double.maxFinite,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFEAEAEA), width: 1.5),
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0D000000),
                      offset: Offset(0, 4),
                      blurRadius: 14,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => controller.selectedRegion.value = "도쿄",
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.96.w, vertical: 11.5.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "도쿄",
                          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600, color: const Color(0xFF0AB6FF)),
                        ),
                        Text(
                          "일본",
                          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: const Color(0xFF42484E)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
