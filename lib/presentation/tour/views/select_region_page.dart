import 'package:flutter/material.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:packit/app/config/app_typeface.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/presentation/widget/packit_appbar.dart';

import '../controller/tour_controller.dart';

class SelectRegionPage extends GetView<TourController> {
  const SelectRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PackitBackAppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 11.64.w),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("여행을 떠날 지역을\n입력해주세요", style: AppTypeFace.to.display1bold),
                  const Spacer(),
                  Row(
                    children: [
                      Text("1", style: AppTypeFace.to.body3SemiBold.copyWith(color: AppColor.mainBlue)),
                      Text("/3", style: AppTypeFace.to.body3SemiBold.copyWith(color: const Color(0xFF6B7684))),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 42.69),
            const _RegionTextField(),
            const Stack(
              children: [
                _LatestSearchWidget(),
                _SearchResultListView(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _RegionTextField extends GetView<TourController> {
  const _RegionTextField();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
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
                  hintStyle: AppTypeFace.to.subHeading1Semibold.copyWith(color: const Color(0xFFB9BFC7)),
                  contentPadding: EdgeInsets.only(bottom: 3.27.h),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.5),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.5),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 6.w),
                    child: SvgPicture.asset(
                      "assets/icons/search.svg",
                      width: 18.w,
                      colorFilter:
                          ColorFilter.mode(controller.searchResultList.isNotEmpty ? AppColor.coolGray200 : AppColor.gray3, BlendMode.srcIn),
                    ),
                  ),
                  prefixIconConstraints: BoxConstraints(maxHeight: 18.h, maxWidth: 24.w),
                ),
                onChanged: (value) async {
                  final Debouncer debouncer = Debouncer();

                  debouncer.debounce(
                    duration: const Duration(milliseconds: 150),
                    onDebounce: () async => await controller.searchDestination(),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class _LatestSearchWidget extends GetView<TourController> {
  const _LatestSearchWidget();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.searchResultList.isNotEmpty) return const SizedBox();

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.04.w, vertical: 39.84.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("최근 검색어", style: AppTypeFace.to.body2Bold),
            SizedBox(height: 10.94.h),
            Wrap(
              spacing: 6.36.w,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.regionTextController.text = "도쿄";
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.2, color: AppColor.gray2),
                        borderRadius: BorderRadius.circular(6.r),
                        color: const Color(0xFFF5F7FD)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.5.h),
                      child: Text("도쿄", style: AppTypeFace.to.body3SemiBold.copyWith(color: AppColor.coolGray200)),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.2, color: AppColor.gray2),
                      borderRadius: BorderRadius.circular(6.r),
                      color: const Color(0xFFF5F7FD)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.5.h),
                    child: Text("베를린", style: AppTypeFace.to.body3SemiBold.copyWith(color: AppColor.coolGray200)),
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

class _SearchResultListView extends GetView<TourController> {
  const _SearchResultListView();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.searchResultList.isNotEmpty) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.5.w, vertical: 8.21.h),
            child: SizedBox(
              width: double.maxFinite,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.coolGray100, width: 1),
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.white,
                ),
                child: const _SearchResultWidget(),
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

class _SearchResultWidget extends GetView<TourController> {
  const _SearchResultWidget();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        itemCount: controller.searchResultList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              controller.selectedRegion.value = controller.searchResultList[index].city;
              controller.selectedRegionId = controller.searchResultList[index].id;
              Get.toNamed(RoutePath.selectTitle);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.5.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.searchResultList[index].city,
                    style: AppTypeFace.to.subHeading4Medium.copyWith(color: AppColor.mainBlue),
                  ),
                  Text(
                    controller.searchResultList[index].country,
                    style: AppTypeFace.to.body4SemiBold.copyWith(color: AppColor.coolGray300),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
