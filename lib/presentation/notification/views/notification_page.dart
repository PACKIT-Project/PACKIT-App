import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:packit/app/config/app_typeface.dart';
import 'package:packit/presentation/widget/packit_appbar.dart';

import '../controller/notification_controller.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PackitBackAppBar(
        title: "알림",
        actions: [
          Obx(() {
            if (controller.notificationList.isEmpty) return const SizedBox();

            return Padding(
              padding: EdgeInsets.only(right: 29.w),
              child: GestureDetector(
                onTap: () {},
                child: Text("삭제", style: AppTypeFace.to.subHeading2Semibold.copyWith(decoration: TextDecoration.underline)),
              ),
            );
          })
        ],
      ),
      body: Obx(() {
        if (controller.notificationList.isEmpty) {
          return const _NoNotificationView();
        } else {
          return const _NotificationListView();
        }
      }),
    );
  }
}

class _NoNotificationView extends StatelessWidget {
  const _NoNotificationView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/notification_empty.svg', width: 120.w, height: 120.w),
          SizedBox(height: 16.25.h),
          Text("아직 받은 알림이 없어요.", style: AppTypeFace.to.body5SemiBold.copyWith(color: AppColor.coolGray300)),
          SizedBox(height: 5.59.h),
          Text("새로운 소식이 도착하면 알려드릴게요", style: AppTypeFace.to.body4SemiBold.copyWith(color: AppColor.gray4)),
        ],
      ),
    );
  }
}

class _NotificationListView extends GetView<NotificationController> {
  const _NotificationListView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, top: 13.37.w, right: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 13.37.h),
          Text("오늘", style: AppTypeFace.to.body4SemiBold.copyWith(color: AppColor.coolGray100)),
          ListView.builder(
            shrinkWrap: true,
            itemCount: controller.notificationList.length,
            itemBuilder: (BuildContext context, int index) {
              NotificationModel notification = controller.notificationList[index];

              return Padding(
                padding: EdgeInsets.fromLTRB(12.02.w, 20.38.w, 13.98.w, 23.62.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/notification/${notification.type.name}.svg',
                      width: 36.w,
                      height: 36.w,
                    ),
                    SizedBox(width: 9.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(notification.title, style: AppTypeFace.to.body4SemiBold),
                          Text(
                            notification.description,
                            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, color: AppColor.coolGray100),
                          ),
                        ],
                      ),
                    ),
                    Text("5분전", style: AppTypeFace.to.caption1Semibold.copyWith(color: AppColor.gray5))
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
