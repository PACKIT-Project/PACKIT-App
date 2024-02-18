import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:packit/app/config/app_typeface.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/presentation/widget/packit_appbar.dart';
import 'package:packit/presentation/widget/packit_bottom_sheet.dart';
import 'package:packit/presentation/widget/packit_dialog.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PackitBackAppBar(title: "설정"),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.08.h),
            const _SettingHeaderWidget("설정"),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => Get.toNamed(RoutePath.notificationSetting),
              child: _SettingItemWidget(
                title: "알림 설정",
                child: SvgPicture.asset('assets/icons/profile/navigate_next.svg', width: 24.w, height: 24.w),
              ),
            ),
            const _SettingDividerWidget(),
            const _SettingHeaderWidget("정보"),
            _SettingItemWidget(
              title: "약관 및 정책",
              hasDivider: true,
              child: SvgPicture.asset('assets/icons/profile/navigate_next.svg', width: 24.w, height: 24.w),
            ),
            _SettingItemWidget(
              title: "개인정보 처리방침",
              hasDivider: true,
              child: SvgPicture.asset('assets/icons/profile/navigate_next.svg', width: 24.w, height: 24.w),
            ),
            const _SettingDividerWidget(),
            const _SettingHeaderWidget("기타"),
            _SettingItemWidget(
              title: "고객센터",
              hasDivider: true,
              child: Text("PPACKITT@gmail.com", style: AppTypeFace.to.caption1Semibold.copyWith(color: AppColor.coolGray100)),
            ),
            _SettingItemWidget(
              title: "버전 정보",
              child: Text("최신 버전", style: AppTypeFace.to.caption1Semibold.copyWith(color: AppColor.coolGray100)),
            ),
            const _SettingDividerWidget(),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async => showPackitDialog(context, PackitDialogType.logout, null),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: AppColor.gray3),
                  height: 54.h,
                  child: Text("로그아웃", style: AppTypeFace.to.body1Medium.copyWith(color: AppColor.coolGray100)),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Center(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async => await showPackitBottomSheet(context, PackitBottomSheetType.deleteMember),
                child: Text(
                  "회원탈퇴",
                  style: AppTypeFace.to.body3SemiBold.copyWith(color: AppColor.coolGray100, decoration: TextDecoration.underline),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SettingHeaderWidget extends StatelessWidget {
  const _SettingHeaderWidget(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 31.h,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 29.w),
      child: Text(title, style: AppTypeFace.to.caption1Semibold.copyWith(color: AppColor.gray4)),
    );
  }
}

class _SettingItemWidget extends StatelessWidget {
  const _SettingItemWidget({required this.title, required this.child, this.hasDivider = true});

  final String title;
  final Widget child;
  final bool hasDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: hasDivider ? Border(bottom: BorderSide(color: AppColor.gray1, width: 1.h)) : null,
      ),
      padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 19.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title, style: AppTypeFace.to.body3SemiBold), child],
      ),
    );
  }
}

class _SettingDividerWidget extends StatelessWidget {
  const _SettingDividerWidget();

  @override
  Widget build(BuildContext context) {
    return Divider(thickness: 9.5.h, height: 9.5.h, color: AppColor.gray1);
  }
}
