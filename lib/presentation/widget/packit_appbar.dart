import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:packit/app/config/app_color.dart';

class PackitAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PackitAppBar({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leadingWidth: 40.25.w,
      leading: Row(
        children: [
          SizedBox(width: 24.68.w),
          SvgPicture.asset('assets/icons/arrow_back.svg', width: 15.57.w, height: 15.16.h),
        ],
      ),
      title: Text(title ?? ""),
      titleTextStyle: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700, color: AppColor.coolGray400),
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(43);
}
