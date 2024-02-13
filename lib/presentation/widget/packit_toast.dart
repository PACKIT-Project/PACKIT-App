import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:packit/app/config/app_typeface.dart';

showPackitToast(BuildContext context, String text) async {
  return await context.showToast(
    Row(
      children: [
        SvgPicture.asset('assets/icons/circle_check_fill.svg', width: 20.w, height: 20.w),
        SizedBox(width: 16.w),
        Text(text),
      ],
    ),
    duration: const Duration(milliseconds: 3500),
    alignment: Alignment.center,
    margin: EdgeInsets.symmetric(horizontal: 35.w),
    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
    backgroundColor: AppColor.coolGray400,
    surfaceTintColor: AppColor.coolGray400,
    elevation: 15,
    textStyle: AppTypeFace.to.body3SemiBold.copyWith(color: Colors.white),
    queue: false,
  );
}
