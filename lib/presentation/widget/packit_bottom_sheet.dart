import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:packit/app/config/app_typeface.dart';
import 'package:packit/domain/entities/travel_response.dart';
import 'package:packit/presentation/main/controller/tour_controller.dart';
import 'package:percent_indicator/percent_indicator.dart';

enum PackitBottomSheetType { deleteMember, completeCheckList, travelList }

showPackitBottomSheet(BuildContext context, PackitBottomSheetType type) async {
  await showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    barrierColor: Colors.black.withOpacity(0.4),
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
    builder: (BuildContext context) {
      return SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (type == PackitBottomSheetType.deleteMember) const _DeleteMemberBottomSheet(),
              if (type == PackitBottomSheetType.completeCheckList) const _CompleteCheckListBottomSheet(),
              if (type == PackitBottomSheetType.travelList) const _TravelListBottomSheet(),
            ],
          ),
        ),
      );
    },
  );
}

class _CompleteCheckListBottomSheet extends StatefulWidget {
  const _CompleteCheckListBottomSheet();

  @override
  State<_CompleteCheckListBottomSheet> createState() => _CompleteCheckListBottomSheetState();
}

class _CompleteCheckListBottomSheetState extends State<_CompleteCheckListBottomSheet> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    animationController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 38.w),
      child: Column(
        children: [
          SizedBox(height: 49.2.h),
          AnimatedBuilder(
            animation: animationController,
            builder: (BuildContext context, Widget? child) {
              return CircularPercentIndicator(
                radius: 45.w,
                lineWidth: 10.0,
                percent: animationController.value,
                startAngle: 0.0,
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Colors.transparent,
                linearGradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.clamp,
                  stops: [0.0, 1.0],
                  colors: <Color>[Color(0xFF0EA8FF), Color(0xFF28FFCB)],
                ),
                center: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedFlipCounter(
                      duration: const Duration(milliseconds: 200),
                      value: (animationController.value * 100).toInt(),
                      textStyle: TextStyle(fontSize: 15.68.sp, fontWeight: FontWeight.w600, color: AppColor.coolGray300),
                    ),
                    SizedBox(width: 1.96.w),
                    Text(
                      "%",
                      style: TextStyle(fontSize: 15.68.sp, fontWeight: FontWeight.w600, color: AppColor.coolGray100),
                    )
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 26.11.h),
          Text("여행 전 할 일을 모두 완료했어요", style: AppTypeFace.to.display2Semibold.copyWith(color: AppColor.coolGray400)),
          Text("여행 친구들에게 완료 알림을 보내보세요.", style: AppTypeFace.to.body4SemiBold.copyWith(color: AppColor.coolGray100)),
          SizedBox(height: 57.1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: _BottomSheetButton("나중에", textColor: AppColor.coolGray100, color: AppColor.gray2, onTap: () => Get.back())),
              SizedBox(width: 12.65.w),
              Expanded(child: _BottomSheetButton("알림 보내기", textColor: Colors.white, color: AppColor.mainBlue, onTap: () => Get.back())),
            ],
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

class _DeleteMemberBottomSheet extends StatelessWidget {
  const _DeleteMemberBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(38.w, 54.1.h, 38.w, 20.w),
      child: Column(
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
      ),
    );
  }
}

class _TravelListBottomSheet extends StatelessWidget {
  const _TravelListBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.5.w),
      child: DefaultTabController(
        length: 2,
        child: SizedBox(
          height: 400.h,
          child: Column(
            children: [
              SizedBox(height: 8.h),
              Container(
                width: 40.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: AppColor.gray3,
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              SizedBox(height: 17.h),
              SizedBox(
                height: 28.h,
                child: TabBar(
                  isScrollable: true,
                  padding: EdgeInsets.zero,
                  tabAlignment: TabAlignment.start,

                  // label Decoration
                  labelColor: AppColor.coolGray400,
                  labelStyle: AppTypeFace.to.subHeading2Semibold,
                  labelPadding: EdgeInsets.symmetric(horizontal: 4.5.w),

                  // unselectedLabel Decoration
                  unselectedLabelColor: AppColor.gray3,
                  unselectedLabelStyle: AppTypeFace.to.subHeading2Semibold,

                  // divider & indicator Decoration
                  dividerColor: Colors.transparent,
                  indicator: const UnderlineTabIndicator(borderSide: BorderSide(width: 2.5)),
                  indicatorPadding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.transparent,

                  splashFactory: NoSplash.splashFactory,
                  overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
                  tabs: const [Tab(text: "예정된 여행"), Tab(text: "지난 여행")],
                ),
              ),
              SizedBox(height: 19.h),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.5.w),
                  child: TabBarView(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: Get.find<TourController>().upcomingTravelList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final TravelResponse travel = Get.find<TourController>().upcomingTravelList[index];

                          return GestureDetector(
                            onTap: () {
                              Get.find<TourController>().selectedTravel.value = travel;
                              Get.back();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 11.h),
                              decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColor.gray2))),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(travel.title, style: AppTypeFace.to.body2Bold.copyWith(color: AppColor.coolGray400)),
                                      Row(
                                        children: [
                                          SvgPicture.asset('assets/icons/location.svg'),
                                          SizedBox(width: 1.35.w),
                                          RichText(
                                            text: TextSpan(
                                              style: AppTypeFace.to.caption3Semibold.copyWith(color: AppColor.gray5),
                                              children: [
                                                TextSpan(text: travel.destination),
                                                const TextSpan(text: "·"),
                                                TextSpan(
                                                  text:
                                                      "${DateFormat("yyyy.m.d").format(travel.startDate)} - ${DateFormat("m.d").format(travel.endDate)}",
                                                ),
                                                TextSpan(
                                                    text: " (${DateTime.now().difference(travel.startDate).inDays}일 남음)",
                                                    style: const TextStyle(color: AppColor.mainBlue)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  if (Get.find<TourController>().selectedTravel.value!.id == travel.id)
                                    SvgPicture.asset('assets/icons/home/check_mark.svg', width: 24.w, height: 24.w),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: Get.find<TourController>().pastTravelList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final TravelResponse travel = Get.find<TourController>().pastTravelList[index];

                          return GestureDetector(
                            onTap: () {
                              Get.find<TourController>().selectedTravel.value = travel;
                              Get.back();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 11.h),
                              decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColor.gray2))),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(travel.title, style: AppTypeFace.to.body2Bold.copyWith(color: AppColor.coolGray400)),
                                      Row(
                                        children: [
                                          SvgPicture.asset('assets/icons/location.svg'),
                                          SizedBox(width: 1.35.w),
                                          RichText(
                                            text: TextSpan(
                                              style: AppTypeFace.to.caption3Semibold.copyWith(color: AppColor.gray5),
                                              children: [
                                                TextSpan(text: travel.destination),
                                                const TextSpan(text: "·"),
                                                TextSpan(
                                                  text:
                                                      "${DateFormat("yyyy.m.d").format(travel.startDate)} - ${DateFormat("m.d").format(travel.endDate)}",
                                                ),
                                                TextSpan(
                                                    text: " (${DateTime.now().difference(travel.endDate).inDays}일 지남)",
                                                    style: const TextStyle(color: AppColor.mainBlue)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  if (Get.find<TourController>().selectedTravel.value!.id == travel.id)
                                    SvgPicture.asset('assets/icons/home/check_mark.svg', width: 24.w, height: 24.w),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
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
