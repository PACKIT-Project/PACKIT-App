import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:packit/app/config/app_typeface.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/presentation/home/views/travel_view.dart';
import 'package:packit/presentation/main/controller/tour_controller.dart';
import 'package:packit/presentation/widget/packit_appbar.dart';

class HomeView extends GetView<TourController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PackitAppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: GestureDetector(
                onTap: () => Get.toNamed(RoutePath.notification),
                child: SvgPicture.asset('assets/icons/home/notification.svg', width: 24.w, height: 24.w)),
          ),
        ],
      ),
      body: Obx(
        () {
          if (controller.selectedTravel.value == null) return const _EmptyView();

          return const TravelView();
        },
      ),
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/travel.svg'),
          SizedBox(height: 20.17.h),
          Text("새로운 여행 준비를 시작해보세요.", style: AppTypeFace.to.body3SemiBold.copyWith(color: AppColor.gray4))
        ],
      ),
    );
  }
}
