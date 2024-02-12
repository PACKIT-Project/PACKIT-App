import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:packit/app/config/app_typeface.dart';
import 'package:packit/domain/entities/travel_response.dart';
import 'package:packit/presentation/profile/controller/profile_tab_controller.dart';
import 'package:packit/presentation/widget/packit_appbar.dart';
import 'package:packit/presentation/widget/packit_toast.dart';

class InviteTravelPage extends GetView<ProfileController> {
  InviteTravelPage({super.key});

  final TravelResponse travel = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PackitBackAppBar(),
      body: FutureBuilder(
          future: controller.getInvitationInfo(travel.id),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 6.61.h),
                  Text(travel.title, style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600, letterSpacing: 1.21)),
                  SizedBox(height: 6.62.h),
                  RichText(
                    text: TextSpan(
                      style: AppTypeFace.to.subHeading1Semibold.copyWith(color: AppColor.coolGray300),
                      children: [
                        const TextSpan(text: "여행 친구 "),
                        TextSpan(
                            text: "${travel.memberNum}명", style: AppTypeFace.to.subHeading1Semibold.copyWith(color: AppColor.mainBlue)),
                        TextSpan(text: " (${8 - travel.memberNum}명 남음)"),
                      ],
                    ),
                  ),
                  SizedBox(height: 6.62.h),
                  Text("여행 친구는 최대 8명까지 초대가 가능합니다.", style: AppTypeFace.to.caption2Medium.copyWith(color: AppColor.coolGray300)),
                  SizedBox(height: 21.61.h),
                  Row(
                    children: [
                      Expanded(
                        child: _InvitePageButton(
                          "카카오톡 초대",
                          iconPath: "assets/icons/kakao.svg",
                          onTap: () async => await controller.inviteKakao(snapshot.data.invitationCode),
                          color: const Color(0xFFFEE500),
                        ),
                      ),
                      SizedBox(width: 11.w),
                      Expanded(
                        child: _InvitePageButton(
                          "초대코드 복사",
                          iconPath: "assets/icons/profile/copy.svg",
                          onTap: () async {
                            Clipboard.setData(ClipboardData(text: snapshot.data.invitationCode));
                            await showPackitToast(context, "초대코드가 복사되었습니다.");
                          },
                          color: AppColor.coolGray100,
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class _InvitePageButton extends StatelessWidget {
  const _InvitePageButton(this.text, {this.textColor, required this.color, required this.iconPath, required this.onTap});

  final String text;
  final Color? textColor;
  final Color color;
  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 27.5.w, vertical: 9.87.h),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r), color: color),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iconPath),
            SizedBox(width: 6.w),
            Text(text, style: AppTypeFace.to.body4SemiBold.copyWith(color: textColor ?? Colors.black)),
          ],
        ),
      ),
    );
  }
}
