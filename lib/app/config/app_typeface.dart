import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:packit/app/config/app_color.dart';

class AppTypeFace {
  static AppTypeFace to = AppTypeFace();

  // Title
  TextStyle display1bold = TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700, color: AppColor.coolGray500);
  TextStyle display2Semibold = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, color: AppColor.coolGray500);
  TextStyle subHeading1Semibold = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: AppColor.coolGray500);
  TextStyle subHeading2Semibold = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700, color: AppColor.coolGray500);
  TextStyle subHeading3Semibold = TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600, color: AppColor.coolGray500);
  TextStyle subHeading4Medium = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500, color: AppColor.coolGray500);
  TextStyle hero1Bold = TextStyle(fontSize: 34.sp, fontWeight: FontWeight.w700, color: AppColor.coolGray500);

  // Text
  TextStyle body1Medium = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: AppColor.coolGray500);
  TextStyle body2Bold = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, color: AppColor.coolGray500);
  TextStyle body3SemiBold = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: AppColor.coolGray500);
  TextStyle body4SemiBold = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColor.coolGray500);
  TextStyle body5SemiBold = TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600, color: AppColor.coolGray500);
  TextStyle body6Medium = TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500, color: AppColor.coolGray500);

  // Description
  TextStyle caption1Semibold = TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600, color: AppColor.coolGray500);
  TextStyle caption2Medium = TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppColor.coolGray500);
  TextStyle caption3Semibold = TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600, color: AppColor.coolGray500);

  // Button
  TextStyle label1Bold = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, color: AppColor.coolGray500);
}
