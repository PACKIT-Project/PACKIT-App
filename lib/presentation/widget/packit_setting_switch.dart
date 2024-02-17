import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:packit/app/config/app_typeface.dart';

class PackitSettingSwitch extends StatelessWidget {
  const PackitSettingSwitch({super.key, required this.title, required this.description, required this.onChanged});

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
