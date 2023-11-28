import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:packit/app/config/app_color.dart';

class PackitButton extends StatelessWidget {
  const PackitButton(this.text, {super.key, required this.onTap});

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.maxFinite,
          height: 54.w,
          decoration:
              BoxDecoration(color: onTap != null ? AppColor.mainBlue : AppColor.mainBlueInActive, borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: Text(text, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
