import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:packit/app/config/app_typeface.dart';

enum PackitBottomSheetType { deleteMember }

showPackitBottomSheet(BuildContext context) async {
  await showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    barrierColor: Colors.black.withOpacity(0.4),
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
    builder: (BuildContext context) {
      return SafeArea(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.fromLTRB(38.w, 54.1.h, 38.w, 20.w),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (PackitBottomSheetType.deleteMember == PackitBottomSheetType.deleteMember) _DeleteMemberBottomSheet(),
            ],
          ),
        ),
      );
    },
  );
}

class _DeleteMemberBottomSheet extends StatelessWidget {
  const _DeleteMemberBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("정말 탈퇴하시겠습니까?", style: AppTypeFace.to.display2Semibold.copyWith(color: AppColor.coolGray400)),
        SizedBox(height: 4.99.h),
        Text("회원탈퇴 시 PACKIT의 모든 여행 데이터가 삭제되며,\n계정 복구가 불가능합니다.",
            style: AppTypeFace.to.body4SemiBold.copyWith(color: AppColor.coolGray100), textAlign: TextAlign.center),
        SizedBox(height: 36.1.h),
        Row(
          children: [
            Expanded(
              child: _BottomSheetButton(
                "아니요",
                onTap: () => Navigator.pop(context),
                textColor: AppColor.coolGray100,
                color: AppColor.gray2,
              ),
            ),
            SizedBox(width: 12.65.w),
            Expanded(
              child: _BottomSheetButton(
                "네",
                onTap: () {},
                textColor: Colors.white,
                color: AppColor.mainBlue,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _BottomSheetButton extends StatelessWidget {
  const _BottomSheetButton(this.text, {required this.textColor, required this.color, required this.onTap});

  final String text;
  final Color textColor;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        height: 50.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: color,
        ),
        child: Center(child: Text(text, style: AppTypeFace.to.body2Bold.copyWith(color: textColor))),
      ),
    );
  }
}
