// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:packit/app/config/app_typeface.dart';
import 'package:packit/app/extension/travel_date.dart';
import 'package:packit/domain/entities/travel_response.dart';
import 'package:packit/presentation/main/controller/tour_controller.dart';
import 'package:packit/presentation/widget/packit_menu_anchor.dart';

import '../controller/profile_tab_controller.dart';

class MyTravelView extends GetView<ProfileController> {
  const MyTravelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 18.79.h, right: 16.5.w, bottom: 17.33.h),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => controller.travelTabIndex.value = 0,
                  child: Text("예정된 여행",
                      style: AppTypeFace.to.body4SemiBold
                          .copyWith(color: controller.travelTabIndex.value == 0 ? AppColor.coolGray200 : AppColor.gray3)),
                ),
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: () => controller.travelTabIndex.value = 1,
                  child: Text("지난 여행",
                      style: AppTypeFace.to.body4SemiBold
                          .copyWith(color: controller.travelTabIndex.value == 1 ? AppColor.coolGray200 : AppColor.gray3)),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: GetX<TourController>(
            builder: (tourController) {
              if (controller.travelTabIndex.value == 0) {
                return _TravelDetailView(travelList: tourController.upcomingTravelList.value);
              } else {
                return _TravelDetailView(travelList: tourController.pastTravelList.value);
              }
            },
          ),
        ),
      ],
    );
  }
}

class _TravelDetailView extends StatelessWidget {
  const _TravelDetailView({required this.travelList});

  final List<TravelResponse> travelList;

  @override
  Widget build(BuildContext context) {
    if (travelList.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/travel.svg'),
          SizedBox(height: 20.17.h),
          Text("새로운 여행 준비를 시작해보세요.", style: AppTypeFace.to.body3SemiBold.copyWith(color: AppColor.gray4)),
        ],
      );
    } else {
      return ListView.builder(
        itemCount: travelList.length,
        itemBuilder: (context, i) {
          return Container(
            padding: EdgeInsets.fromLTRB(22.55.w, 12.h, 16.17.w, 12.h),
            decoration: BoxDecoration(
              border: const Border(bottom: BorderSide(width: 1, color: AppColor.gray2)),
              borderRadius: BorderRadius.circular(8.w),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    travelList[i].dDay < 0
                        ? Text("D+${travelList[i].dDay.abs()}", style: AppTypeFace.to.body4SemiBold.copyWith(color: AppColor.mainBlue))
                        : Text("D-${travelList[i].dDay}", style: AppTypeFace.to.body4SemiBold.copyWith(color: AppColor.mainBlue)),
                    SizedBox(width: 5.w),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r), color: AppColor.gray1),
                      child: Row(children: [
                        SvgPicture.asset('assets/icons/profile/user.svg', width: 10.w, height: 10.w),
                        SizedBox(width: 3.w),
                        Text("${travelList[i].memberNum}/8", style: AppTypeFace.to.caption3Semibold.copyWith(color: AppColor.gray5)),
                      ]),
                    ),
                    const Spacer(),
                    PackitTravelMenuAnchor(travel: travelList[i]),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(travelList[i].title, style: AppTypeFace.to.body3SemiBold.copyWith(color: AppColor.coolGray400)),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/profile/location.svg'),
                    SizedBox(width: 1.35.w),
                    Text(
                      "${travelList[i].destination}·${travelList[i].endDate.toNDayString(travelList[i].startDate)}",
                      style: AppTypeFace.to.caption1Semibold.copyWith(color: AppColor.gray5),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
