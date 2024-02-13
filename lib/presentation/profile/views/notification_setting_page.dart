import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:packit/app/config/app_typeface.dart';
import 'package:packit/presentation/widget/packit_appbar.dart';

class NotificationSettingPage extends StatelessWidget {
  const NotificationSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PackitBackAppBar(title: "앱 알림 설정"),
      body: Column(children: [
        _NotificationSettingItemWidget(title: "활동 알림", description: "모든 여행의 할 일 완료, 재촉 등 알림", onChanged: (value) {}),
        _NotificationSettingItemWidget(title: "전체 여행 리마인드 알림", description: "설정한 전체 여행 리마인드 알림", onChanged: (value) {}),
      ]),
    );
  }
}

class _NotificationSettingItemWidget extends StatelessWidget {
  const _NotificationSettingItemWidget({required this.title, required this.description, required this.onChanged});

  final String title;
  final String description;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 21.31.h, 16.w, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTypeFace.to.subHeading2Semibold),
              SizedBox(height: 8.h),
              Text(description, style: AppTypeFace.to.body6Medium.copyWith(color: AppColor.gray5)),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: 54.w,
            height: 32.w,
            child: Switch(
              value: false,
              onChanged: onChanged,
              inactiveTrackColor: AppColor.gray2,
              activeTrackColor: AppColor.mainBlue,
              thumbColor: MaterialStateProperty.all(Colors.white),
              trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }
}
