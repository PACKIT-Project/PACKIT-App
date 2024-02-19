import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:packit/app/config/app_typeface.dart';
import 'package:packit/domain/entities/check_list_response.dart';
import 'package:packit/presentation/main/controller/tour_controller.dart';
import 'package:packit/presentation/widget/packit_appbar.dart';

class ClusterDetailPage extends StatelessWidget {
  const ClusterDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryResponse category = Get.arguments;
    final TextEditingController textEditingController = TextEditingController();
    final FocusNode focusNode = FocusNode();

    focusNode.requestFocus();
    textEditingController.text = category.title;

    return Scaffold(
      appBar: const PackitBackAppBar(title: "할 일 관리"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            SizedBox(height: 26.92.h),
            TextField(
              controller: textEditingController,
              focusNode: focusNode,
              style: AppTypeFace.to.subHeading4Medium.copyWith(color: AppColor.coolGray300),
              decoration: InputDecoration(
                isDense: true,
                hintText: "할 일을 입력해주세요",
                hintStyle: AppTypeFace.to.subHeading4Medium.copyWith(color: AppColor.coolGray300),
                contentPadding: EdgeInsets.only(bottom: 3.h),
                border: const UnderlineInputBorder(borderSide: BorderSide(color: AppColor.coolGray200, width: 1.4)),
                enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColor.coolGray200, width: 1.4)),
                focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColor.coolGray200, width: 1.4)),
              ),
            ),
            SizedBox(height: 16.14.h),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async => await Get.find<TourController>().deleteCategory(category.categoryId),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r), color: AppColor.gray1),
                      padding: EdgeInsets.symmetric(vertical: 9.h),
                      child: Text("삭제", style: AppTypeFace.to.body3SemiBold.copyWith(color: AppColor.alert)),
                    ),
                  ),
                ),
                SizedBox(width: 11.w),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      await Get.find<TourController>().updateCategory(category.categoryId, textEditingController.text);
                      Get.back();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r), color: AppColor.gray1),
                      padding: EdgeInsets.symmetric(vertical: 9.h),
                      child: Text("확인", style: AppTypeFace.to.body3SemiBold.copyWith(color: AppColor.coolGray300)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
