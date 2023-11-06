import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackitButton extends StatelessWidget {
  const PackitButton(this.text, {super.key, required this.onTap, this.color});

  final String text;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.maxFinite,
          height: 54.h,
          decoration: BoxDecoration(color: color ?? const Color(0xFF0EA8FF), borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: Text(text, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
