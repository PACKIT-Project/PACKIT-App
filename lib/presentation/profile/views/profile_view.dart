import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:packit/app/config/app_typeface.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/presentation/profile/controller/profile_tab_controller.dart';
import 'package:packit/presentation/widget/packit_appbar.dart';

import 'my_travel_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PackitAppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: GestureDetector(
              onTap: () => Get.toNamed(RoutePath.setting),
              child: SvgPicture.asset('assets/icons/profile/settings.svg', width: 24.w, height: 24.w),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 16.11.h),
          const _ProfileHeaderWidget(),
          SizedBox(height: 39.49.h),
          const _TabBarWidget(),
          const Expanded(child: _TabBarViewWidget()),
        ],
      ),
    );
  }
}

class _ProfileHeaderWidget extends StatelessWidget {
  const _ProfileHeaderWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 31.4.w),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/profile/person.svg', width: 80.w, height: 80.w),
          SizedBox(width: 20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("hana", style: TextStyle(fontSize: 21.sp, fontWeight: FontWeight.w700, color: AppColor.coolGray300)),
              SizedBox(height: 7.h),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 5.w),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.w), color: AppColor.gray1),
                  child: Text("프로필 편집", style: AppTypeFace.to.body6Medium.copyWith(color: AppColor.coolGray100)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _TabBarWidget extends GetView<ProfileController> {
  const _TabBarWidget();

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller.tabController,
      tabs: controller.tabs,

      // label Decoration
      labelColor: AppColor.coolGray300,
      labelStyle: AppTypeFace.to.body5SemiBold,

      // unselected label Decoration
      unselectedLabelColor: AppColor.gray3,
      unselectedLabelStyle: AppTypeFace.to.body5SemiBold,

      // divider & indicator Decoration
      dividerColor: AppColor.gray3,
      indicator: const UnderlineTabIndicator(borderSide: BorderSide(width: 2)),
      indicatorColor: Colors.transparent,
      indicatorSize: TabBarIndicatorSize.tab,

      // splash
      splashFactory: NoSplash.splashFactory,
      overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
    );
  }
}

class _TabBarViewWidget extends GetView<ProfileController> {
  const _TabBarViewWidget();

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller.tabController,
      children: const [MyTravelView(), Placeholder()],
    );
  }
}
