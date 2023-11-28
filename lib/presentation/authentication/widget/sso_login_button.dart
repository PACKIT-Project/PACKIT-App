import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SSOLoginButton extends StatelessWidget {
  const SSOLoginButton(
    this.text, {
    this.border,
    this.iconName,
    this.textColor,
    required this.color,
    required this.onPressed,
    super.key,
  });

  final String text;
  final Border? border;
  final String? iconName;
  final Color? textColor;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 316.w,
        height: 54.w,
        decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconName != null) ...[
                SvgPicture.asset(
                  "assets/icons/$iconName.svg",
                  width: 24.w,
                  height: 24.w,
                ),
                SizedBox(width: 6.w),
              ],
              Text(text, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: textColor)),
            ],
          ),
        ),
      ),
    );
  }
}
