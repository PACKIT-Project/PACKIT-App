import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:packit/app/config/app_typeface.dart';
import 'package:packit/app/service/auth_service.dart';
import 'package:packit/presentation/main/controller/tour_controller.dart';

import 'packit_toast.dart';

enum PackitDialogType { deleteCluster, deleteTravel, logout }

showPackitDialog(BuildContext context, PackitDialogType type, dynamic data) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: AlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 24.h),
          insetPadding: EdgeInsets.symmetric(horizontal: 35.5.w),
          scrollable: true,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
          elevation: 0,
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (type == PackitDialogType.deleteCluster) _DeleteClusterDialog(data),
                if (type == PackitDialogType.deleteTravel) _DeleteTravelDialog(data),
                if (type == PackitDialogType.logout) const _LogoutDialog(),
              ],
            ),
          ),
        ),
      );
    },
  );
}

class _DeleteClusterDialog extends StatelessWidget {
  const _DeleteClusterDialog(this.data);

  final int data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("준비물 그룹을 삭제하시겠어요?", style: AppTypeFace.to.subHeading2Semibold.copyWith(color: AppColor.coolGray400)),
        SizedBox(height: 9.h),
        Text("삭제하신 항목은 복구가 불가능합니다.", style: AppTypeFace.to.body4SemiBold.copyWith(color: AppColor.coolGray200)),
        SizedBox(height: 47.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => Navigator.of(context).pop(false),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.5.w),
                    child: Text("취소", style: AppTypeFace.to.subHeading2Semibold.copyWith(color: AppColor.coolGray100)))),
            GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async {
                  try {
                    await Get.find<TourController>().deleteCluster(data);
                    Get.back();
                    if (context.mounted) await showPackitToast(context, "삭제가 완료되었습니다.");
                  } catch (e) {
                    if (kDebugMode) print(e);
                  }
                },
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.5.w),
                    child: Text("삭제", style: AppTypeFace.to.subHeading2Semibold.copyWith(color: AppColor.alert)))),
          ],
        )
      ],
    );
  }
}

class _DeleteTravelDialog extends StatelessWidget {
  const _DeleteTravelDialog(this.travelId);

  final int travelId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("여행을 삭제하시겠어요?", style: AppTypeFace.to.subHeading2Semibold.copyWith(color: AppColor.coolGray400)),
        SizedBox(height: 9.h),
        Text("삭제하신 항목은 복구가 불가능합니다.", style: AppTypeFace.to.body4SemiBold.copyWith(color: AppColor.coolGray200)),
        SizedBox(height: 47.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => Navigator.of(context).pop(false),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.5.w),
                    child: Text("취소", style: AppTypeFace.to.subHeading2Semibold.copyWith(color: AppColor.coolGray100)))),
            GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async {
                  try {
                    await Get.find<TourController>().deleteTravel(travelId);

                    if (context.mounted) {
                      Navigator.of(context).pop(true);
                      await showPackitToast(context, "삭제가 완료되었습니다.");
                    }
                  } catch (e) {
                    if (kDebugMode) print(e);
                  }
                },
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.5.w),
                    child: Text("삭제", style: AppTypeFace.to.subHeading2Semibold.copyWith(color: AppColor.alert)))),
          ],
        )
      ],
    );
  }
}

class _LogoutDialog extends StatelessWidget {
  const _LogoutDialog();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("로그아웃 하시겠습니까?", style: AppTypeFace.to.subHeading2Semibold.copyWith(color: AppColor.coolGray400)),
        SizedBox(height: 53.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => Navigator.of(context).pop(false),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.5.w),
                    child: Text("취소", style: AppTypeFace.to.subHeading2Semibold.copyWith(color: AppColor.coolGray100)))),
            GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async => await AuthService.to.logout(),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.5.w),
                    child: Text("확인", style: AppTypeFace.to.subHeading2Semibold.copyWith(color: AppColor.alert)))),
          ],
        )
      ],
    );
  }
}
