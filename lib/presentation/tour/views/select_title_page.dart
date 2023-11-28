import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/presentation/tour/controller/tour_controller.dart';
import 'package:packit/presentation/widget/packit_appbar.dart';
import 'package:packit/presentation/widget/packit_button.dart';

class SelectTitlePage extends GetView<TourController> {
  const SelectTitlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PackitAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                children: [
                  SizedBox(height: 11.64.w),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("여행의 제목을\n입력해주세요",
                              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700, color: AppColor.coolGray300)),
                          SizedBox(height: 6.05.w),
                          Text("제목은 14자까지 입력 가능합니다",
                              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600, color: AppColor.coolGray100)),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text("2", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: AppColor.mainBlue)),
                          Text("/3", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: const Color(0xFF6B7684))),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30.31.w),
                  SizedBox(
                    child: TextField(
                      controller: controller.tourTitleTextController,
                      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: AppColor.coolGray400),
                      maxLength: 14,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8.5.w, vertical: 14.w),
                        counterText: "",
                        hintText: "여행의 제목을 입력해주세요",
                        hintStyle: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: AppColor.gray3),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.r),
                          borderSide: const BorderSide(width: 1.5, color: AppColor.coolGray200),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.r),
                          borderSide: const BorderSide(width: 1.5, color: AppColor.coolGray200),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Container(
                            width: 48.w,
                            height: 34.w,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r), color: AppColor.mainBlue1),
                            child: Center(
                                child: Text(controller.selectedRegion.value,
                                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: AppColor.mainBlue))),
                          ),
                        ),
                        prefixIconConstraints: BoxConstraints(maxWidth: 64.w, maxHeight: 34.w),
                        suffixIcon: ValueListenableBuilder<TextEditingValue>(
                          valueListenable: controller.tourTitleTextController,
                          builder: (context, value, child) {
                            if (value.text.isNotEmpty) {
                              return Icon(Icons.cancel, color: AppColor.gray3, size: 18.w);
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: controller.tourTitleTextController,
              builder: (context, value, child) {
                return PackitButton("다음", onTap: value.text.isNotEmpty ? () => Get.toNamed(RoutePath.selectDate) : null);
              },
            ),
            SizedBox(height: 28.w),
          ],
        ),
      ),
    );
  }
}
