import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:packit/app/config/app_typeface.dart';
import 'package:packit/app/extension/travel_date.dart';
import 'package:packit/domain/entities/check_list_response.dart';
import 'package:packit/domain/entities/travel_response.dart';
import 'package:packit/presentation/main/controller/tour_controller.dart';
import 'package:packit/presentation/widget/packit_bottom_sheet.dart';
import 'package:packit/presentation/widget/packit_checkbox.dart';
import 'package:packit/presentation/widget/packit_menu_anchor.dart';
import 'package:progress_border/progress_border.dart';

class TravelView extends GetView<TourController> {
  const TravelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TravelViewHeaderWidget(travel: controller.selectedTravel.value!),
          Padding(
            padding: EdgeInsets.only(top: 16.97.h, bottom: 20.11.h),
            child: Divider(color: AppColor.gray2, thickness: 1.h, height: 1.h),
          ),
          const _TravelMemberWidget(),
          SizedBox(height: 19.4.h),
          const _TravelClusterWidget(),
          SizedBox(height: 15.12.h),
          const Expanded(child: _TravelCategoryWidget()),
        ],
      ),
    );
  }
}

class _TravelViewHeaderWidget extends StatelessWidget {
  const _TravelViewHeaderWidget({required this.travel});

  final TravelResponse travel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  travel.dDay < 0
                      ? Text("D+${travel.dDay.abs()}", style: AppTypeFace.to.body2Bold.copyWith(color: AppColor.mainBlue))
                      : Text("D-${travel.dDay}", style: AppTypeFace.to.body2Bold.copyWith(color: AppColor.mainBlue)),
                  SizedBox(width: 5.w),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r), color: AppColor.gray1),
                    child: Row(children: [
                      SvgPicture.asset('assets/icons/user.svg', width: 10.w, height: 10.w),
                      SizedBox(width: 3.w),
                      Text("${travel.memberNum}/8", style: AppTypeFace.to.caption3Semibold.copyWith(color: AppColor.gray5)),
                    ]),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(travel.title, style: AppTypeFace.to.display2Semibold.copyWith(color: AppColor.coolGray400)),
                  SizedBox(width: 6.w),
                  GestureDetector(
                      onTap: () async => showPackitBottomSheet(context, PackitBottomSheetType.travelList),
                      child: SvgPicture.asset('assets/icons/home/arrow_down.svg', width: 14.w, height: 14.w)),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/location.svg'),
                  SizedBox(width: 1.35.w),
                  Text(
                    "${travel.destination}·${travel.endDate.toNDayString(travel.startDate)}",
                    style: AppTypeFace.to.body4SemiBold.copyWith(color: AppColor.gray5),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          PackitMainMenuAnchor(travel: travel),
        ],
      ),
    );
  }
}

class _TravelMemberWidget extends GetView<TourController> {
  const _TravelMemberWidget();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.5.w),
          child: Wrap(
            spacing: 10.w,
            children: [
              for (int i = 0; i < controller.travelMemberList.length; i++)
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 54.w,
                          height: 54.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: controller.travelMemberList[i].unCheckedNum == 0 && controller.travelMemberList[i].checkedNum != 0
                                ? null
                                : ProgressBorder.all(
                                    width: 2.7.w,
                                    backgroundBorder: Border.all(color: AppColor.gray3, width: 2.7.w),
                                    color: AppColor.mainBlue,
                                    progress: controller.travelMemberList[i].checkedNum /
                                        (controller.travelMemberList[i].checkedNum + controller.travelMemberList[i].unCheckedNum),
                                  ),
                          ),
                          child: AnimatedOpacity(
                            opacity: controller.travelMemberList[i].unCheckedNum == 0 && controller.travelMemberList[i].checkedNum != 0
                                ? 0.58
                                : 1,
                            duration: const Duration(milliseconds: 300),
                            child: controller.travelMemberList[i].profileImg.isNotEmpty
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(200.r),
                                    child: CachedNetworkImage(imageUrl: controller.travelMemberList[i].profileImg))
                                : SvgPicture.asset('assets/icons/profile/person.svg'),
                          ),
                        ),
                        if (controller.travelMemberList[i].unCheckedNum == 0 && controller.travelMemberList[i].checkedNum != 0) ...[
                          Positioned.fill(child: Image.asset('assets/icons/home/circle_complete.png')),
                        ],
                      ],
                    ),
                    SizedBox(height: 6.83.h),
                    Text(controller.travelMemberList[i].nickName, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600)),
                  ],
                ),
              Container(
                width: 54.w,
                height: 54.w,
                decoration: const BoxDecoration(color: AppColor.gray1, shape: BoxShape.circle),
                child: Icon(Icons.add, size: 24.w, color: AppColor.coolGray100),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TravelClusterWidget extends GetView<TourController> {
  const _TravelClusterWidget();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: double.maxFinite,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Wrap(
                spacing: 6.w,
                children: [
                  SizedBox(width: 9.75.w),
                  for (int i = 0; i < controller.selectedCheckList.value!.travelClusterList.length; i++) ...[
                    GestureDetector(
                      onTap: () => controller.selectedClusterIndex.value = i,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.w),
                        decoration: BoxDecoration(
                          color: controller.selectedClusterIndex.value == i ? AppColor.mainBlue2 : AppColor.gray1,
                          border: Border.all(
                              width: 1.4, color: controller.selectedClusterIndex.value == i ? AppColor.mainBlue : AppColor.gray2),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              controller.selectedCheckList.value!.travelClusterList[i].title,
                              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              controller.selectedCheckList.value!.travelClusterList[i].allItemNum.toString(),
                              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: const Color(0xFF0EA8FF)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset('assets/icons/home/list_add.svg'),
                    Container(
                      width: 16.25.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white.withOpacity(0.8), Colors.white.withOpacity(0.5)],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TravelCategoryWidget extends GetView<TourController> {
  const _TravelCategoryWidget();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      RxList<CategoryResponse> categoryList =
          controller.selectedCheckList.value!.travelClusterList[controller.selectedClusterIndex.value].travelCategoryList.obs;

      return ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: categoryList.length,
          itemBuilder: (BuildContext context, int i) {
            final TextEditingController itemTitleController = TextEditingController();

            return Accordion(
              disableScrolling: true,
              paddingListTop: 0,
              paddingListBottom: 9.1.h,
              paddingBetweenClosedSections: 0,
              paddingBetweenOpenSections: 0,
              paddingListHorizontal: 15.75.w,
              headerBorderColor: AppColor.gray1,
              headerBorderColorOpened: AppColor.gray1,
              headerBackgroundColor: AppColor.gray1,
              headerBackgroundColorOpened: AppColor.gray1,
              headerBorderRadius: 6,
              contentBackgroundColor: Colors.white,
              contentBorderColor: Colors.transparent,
              contentBorderWidth: 0,
              scaleWhenAnimating: false,
              openAndCloseAnimation: false,
              headerPadding: EdgeInsets.fromLTRB(14.w, 7.w, 8.w, 7.w),
              sectionOpeningHapticFeedback: SectionHapticFeedback.none,
              sectionClosingHapticFeedback: SectionHapticFeedback.none,
              children: [
                AccordionSection(
                  isOpen: false,
                  contentHorizontalPadding: 0,
                  contentVerticalPadding: 10.w,
                  header: Row(
                    children: [
                      Obx(
                        () => Row(
                          children: [
                            Text(categoryList[i].title, style: AppTypeFace.to.body4SemiBold.copyWith(color: AppColor.coolGray300)),
                            SizedBox(width: 2.w),
                            Text('${categoryList[i].checkedItemNum}/${categoryList[i].allItemNum}',
                                style: AppTypeFace.to.body4SemiBold.copyWith(color: AppColor.gray4)),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Text("편집", style: AppTypeFace.to.body4SemiBold.copyWith(color: AppColor.coolGray200)),
                      SizedBox(width: 2.w),
                    ],
                  ),
                  content: Column(
                    children: [
                      Obx(
                        () => ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: categoryList[i].travelItemList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 10.w),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.5.w),
                                height: 40.w,
                                decoration:
                                    BoxDecoration(borderRadius: BorderRadius.circular(6.r), border: Border.all(color: AppColor.gray2)),
                                child: Row(children: [
                                  PackitCheckBox(
                                    value: categoryList[i].travelItemList[index].isChecked,
                                    onChanged: (value) async => await controller.checkItem(
                                        categoryList[i].travelItemList[index].itemId, categoryList[i].travelItemList[index].isChecked),
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(categoryList[i].travelItemList[index].title,
                                      style: AppTypeFace.to.subHeading1Semibold.copyWith(color: const Color(0xFF2C2C2C))),
                                ]),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.5.w),
                        height: 40.w,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r), border: Border.all(color: AppColor.gray2)),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/home/plus.svg', width: 20.w, height: 20.w),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: TextField(
                                controller: itemTitleController,
                                style: AppTypeFace.to.body3SemiBold.copyWith(color: const Color(0xFF2C2C2C)),
                                decoration: InputDecoration(
                                  hintText: "항목 추가하기",
                                  hintStyle: AppTypeFace.to.body3SemiBold.copyWith(color: AppColor.gray3),
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                ),
                                onSubmitted: (_) async {
                                  await controller
                                      .createItem(categoryList[i].categoryId, itemTitleController.text)
                                      .then((_) => itemTitleController.clear());
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 2.w),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "리스트 삭제",
                          style: AppTypeFace.to.caption1Semibold
                              .copyWith(color: const Color(0xFF3F4C61), decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  rightIcon: const Icon(Icons.keyboard_arrow_down, color: AppColor.coolGray200, size: 20),
                ),
              ],
            );
          });
    });
  }
}
