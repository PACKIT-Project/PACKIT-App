import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:packit/app/config/app_typeface.dart';

class PackitBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PackitBackAppBar({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leadingWidth: 40.25.w,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Row(
          children: [
            SizedBox(width: 24.68.w),
            SvgPicture.asset('assets/icons/arrow_back.svg', width: 15.57.w, height: 15.16.h),
          ],
        ),
      ),
      title: Text(title ?? ""),
      titleTextStyle: AppTypeFace.to.subHeading2Semibold.copyWith(color: AppColor.coolGray400),
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(43);
}
