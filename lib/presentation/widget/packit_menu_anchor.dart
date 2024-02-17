import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:packit/app/config/app_typeface.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/domain/entities/travel_response.dart';
import 'package:packit/presentation/widget/packit_dialog.dart';

class PackitMainMenuAnchor extends StatelessWidget {
  PackitMainMenuAnchor({super.key, required this.travel});

  final MenuController controller = MenuController();
  final TravelResponse travel;

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      controller: controller,
      alignmentOffset: Offset(-120.w, 0),
      style: MenuStyle(
        backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
        surfaceTintColor: MaterialStateColor.resolveWith((states) => Colors.white),
        shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r))),
        padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.zero),
        elevation: MaterialStateProperty.resolveWith((states) => 15.47),
      ),
      builder: (BuildContext context, MenuController controller, Widget? child) {
        return GestureDetector(
          onTap: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          child: const Icon(Icons.more_horiz),
        );
      },
      menuChildren: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () async {
            try {
              controller.close();
            } catch (e) {
              if (kDebugMode) print(e);
            }
          },
          child: SizedBox(
            width: 148.w,
            child: Padding(
              padding: EdgeInsets.fromLTRB(12.w, 13.5.w, 12.w, 8.5.w),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/home/edit_note.svg', width: 24.w, height: 24.w),
                  SizedBox(width: 6.w),
                  Text("할 일 관리", style: AppTypeFace.to.body3SemiBold.copyWith(color: AppColor.coolGray200)),
                ],
              ),
            ),
          ),
        ),
        Divider(height: 1.w, color: AppColor.gray2),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            controller.close();

            Get.toNamed(RoutePath.travelRemind);
          },
          child: SizedBox(
            width: 148.w,
            child: Padding(
              padding: EdgeInsets.fromLTRB(12.w, 8.5.w, 12.w, 11.5.w),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/home/edit_notifications.svg', width: 24.w, height: 24.w),
                  SizedBox(width: 6.w),
                  Text("리마인드 알림", style: AppTypeFace.to.body3SemiBold.copyWith(color: AppColor.coolGray200)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PackitTravelMenuAnchor extends StatelessWidget {
  PackitTravelMenuAnchor({super.key, required this.travel});

  final MenuController controller = MenuController();
  final TravelResponse travel;

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      controller: controller,
      alignmentOffset: Offset(-120.w, 0),
      style: MenuStyle(
        backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
        surfaceTintColor: MaterialStateColor.resolveWith((states) => Colors.white),
        shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r))),
        padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.zero),
        elevation: MaterialStateProperty.resolveWith((states) => 15.47),
      ),
      builder: (BuildContext context, MenuController controller, Widget? child) {
        return GestureDetector(
          onTap: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          child: const Icon(Icons.more_horiz),
        );
      },
      menuChildren: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () async {
            try {
              controller.close();
              await showPackitDialog(context, PackitDialogType.deleteTravel, travel.id);
            } catch (e) {
              if (kDebugMode) print(e);
            }
          },
          child: SizedBox(
            width: 148.w,
            child: Padding(
              padding: EdgeInsets.fromLTRB(12.w, 13.5.w, 12.w, 8.5.w),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/profile/trash_bin.svg', width: 24.w, height: 24.w),
                  SizedBox(width: 6.w),
                  Text("여행 삭제", style: AppTypeFace.to.body3SemiBold.copyWith(color: AppColor.coolGray200)),
                ],
              ),
            ),
          ),
        ),
        Divider(height: 1.w, color: AppColor.gray2),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            controller.close();
            Get.toNamed(RoutePath.inviteTravel, arguments: travel);
          },
          child: SizedBox(
            width: 148.w,
            child: Padding(
              padding: EdgeInsets.fromLTRB(12.w, 8.5.w, 12.w, 11.5.w),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/profile/key.svg', width: 24.w, height: 24.w),
                  SizedBox(width: 6.w),
                  Text("여행 초대", style: AppTypeFace.to.body3SemiBold.copyWith(color: AppColor.coolGray200)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
