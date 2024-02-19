import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:packit/app/config/app_typeface.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/domain/entities/travel_response.dart';
import 'package:packit/presentation/new_tour/controller/calendar_controller.dart';
import 'package:packit/presentation/widget/packit_dialog.dart';
import 'package:table_calendar/table_calendar.dart';

class PackitCalendarAnchor extends StatelessWidget {
  PackitCalendarAnchor({super.key});

  final MenuController menuController = MenuController();

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      controller: menuController,
      alignmentOffset: Offset(-120.w, 0),
      style: MenuStyle(
        backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
        surfaceTintColor: MaterialStateColor.resolveWith((states) => Colors.white),
        shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r))),
        padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.zero),
        elevation: MaterialStateProperty.resolveWith((states) => 15.47),
      ),
      builder: (BuildContext context, MenuController controller, Widget? child) {
        return GestureDetector(
          onTap: () {
            Get.put<CalendarController>(CalendarController());
            menuController.open();
          },
          child: const Icon(Icons.more_horiz),
        );
      },
      menuChildren: [
        Container(
          padding: EdgeInsets.fromLTRB(21.w, 15.h, 21.w, 23.h),
          width: 315.w,
          height: 370.w,
          child: Column(
            children: [
              const _PackitCalendarWidget(),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => menuController.close(),
                    child: Text("취소", style: AppTypeFace.to.body3SemiBold.copyWith(color: AppColor.coolGray100)),
                  ),
                  SizedBox(width: 21.44.w),
                  GestureDetector(
                      onTap: () {
                        menuController.close();
                      },
                      child: Text("선택", style: AppTypeFace.to.body3SemiBold.copyWith(color: AppColor.mainBlue))),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class PackitMainMenuAnchor extends StatelessWidget {
  PackitMainMenuAnchor({super.key, required this.travel});

  final MenuController controller = MenuController();
  final TravelResponse travel;

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      controller: controller,
      alignmentOffset: Offset(-120.w, 0),
      style: MenuStyle(
        backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
        surfaceTintColor: MaterialStateColor.resolveWith((states) => Colors.white),
        shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r))),
        padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.zero),
        elevation: MaterialStateProperty.resolveWith((states) => 15.47),
      ),
      builder: (BuildContext context, MenuController controller, Widget? child) {
        return GestureDetector(
          onTap: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          child: const Icon(Icons.more_horiz),
        );
      },
      menuChildren: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () async {
            controller.close();

            Get.toNamed(RoutePath.clusterManage);
          },
          child: SizedBox(
            width: 148.w,
            child: Padding(
              padding: EdgeInsets.fromLTRB(12.w, 13.5.w, 12.w, 8.5.w),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/home/edit_note.svg', width: 24.w, height: 24.w),
                  SizedBox(width: 6.w),
                  Text("할 일 관리", style: AppTypeFace.to.body3SemiBold.copyWith(color: AppColor.coolGray200)),
                ],
              ),
            ),
          ),
        ),
        Divider(height: 1.w, color: AppColor.gray2),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            controller.close();

            Get.toNamed(RoutePath.travelRemind);
          },
          child: SizedBox(
            width: 148.w,
            child: Padding(
              padding: EdgeInsets.fromLTRB(12.w, 8.5.w, 12.w, 11.5.w),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/home/edit_notifications.svg', width: 24.w, height: 24.w),
                  SizedBox(width: 6.w),
                  Text("리마인드 알림", style: AppTypeFace.to.body3SemiBold.copyWith(color: AppColor.coolGray200)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PackitTravelMenuAnchor extends StatelessWidget {
  PackitTravelMenuAnchor({super.key, required this.travel});

  final MenuController controller = MenuController();
  final TravelResponse travel;

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      controller: controller,
      alignmentOffset: Offset(-120.w, 0),
      style: MenuStyle(
        backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
        surfaceTintColor: MaterialStateColor.resolveWith((states) => Colors.white),
        shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r))),
        padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.zero),
        elevation: MaterialStateProperty.resolveWith((states) => 15.47),
      ),
      builder: (BuildContext context, MenuController controller, Widget? child) {
        return GestureDetector(
          onTap: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          child: const Icon(Icons.more_horiz),
        );
      },
      menuChildren: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () async {
            try {
              controller.close();
              await showPackitDialog(context, PackitDialogType.deleteTravel, travel.id);
            } catch (e) {
              if (kDebugMode) print(e);
            }
          },
          child: SizedBox(
            width: 148.w,
            child: Padding(
              padding: EdgeInsets.fromLTRB(12.w, 13.5.w, 12.w, 8.5.w),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/profile/trash_bin.svg', width: 24.w, height: 24.w),
                  SizedBox(width: 6.w),
                  Text("여행 삭제", style: AppTypeFace.to.body3SemiBold.copyWith(color: AppColor.coolGray200)),
                ],
              ),
            ),
          ),
        ),
        Divider(height: 1.w, color: AppColor.gray2),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            controller.close();
            Get.toNamed(RoutePath.inviteTravel, arguments: travel);
          },
          child: SizedBox(
            width: 148.w,
            child: Padding(
              padding: EdgeInsets.fromLTRB(12.w, 8.5.w, 12.w, 11.5.w),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/profile/key.svg', width: 24.w, height: 24.w),
                  SizedBox(width: 6.w),
                  Text("여행 초대", style: AppTypeFace.to.body3SemiBold.copyWith(color: AppColor.coolGray200)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PackitCalendarWidget extends StatefulWidget {
  const _PackitCalendarWidget();

  @override
  State<_PackitCalendarWidget> createState() => _PackitCalendarWidgetState();
}

class _PackitCalendarWidgetState extends State<_PackitCalendarWidget> {
  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarFormat: CalendarFormat.month,
      rowHeight: 34.h,

      focusedDay: focusedDay,

      firstDay: DateTime(2010, 1, 1),
      lastDay: DateTime(2099, 12, 31),

      // Header
      headerStyle: HeaderStyle(
        headerPadding: EdgeInsets.only(bottom: 13.h),
        formatButtonVisible: false,

        // Title
        titleCentered: true,
        titleTextStyle: TextStyle(fontSize: 13.82.sp, fontWeight: FontWeight.w700, color: AppColor.coolGray400),

        // Chevron
        leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black, size: 17.w),
        rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black, size: 17.w),
        leftChevronPadding: EdgeInsets.zero,
        rightChevronPadding: EdgeInsets.zero,
      ),

      // Days of Week
      daysOfWeekHeight: 41.h,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(
          color: AppColor.coolGray400,
          fontWeight: FontWeight.w700,
          fontSize: 12.09.sp,
        ),
        weekendStyle: TextStyle(
          color: AppColor.coolGray400,
          fontWeight: FontWeight.w700,
          fontSize: 12.09.sp,
        ),
      ),

      // Calendar
      calendarBuilders: CalendarBuilders(
        selectedBuilder: (context, day, focusedDay) {
          return LayoutBuilder(builder: (context, constraints) {
            return Center(
              child: Container(
                width: constraints.maxWidth - 6.w,
                height: constraints.maxWidth - 6.w,
                decoration: BoxDecoration(
                  color: AppColor.mainBlue,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Text(
                    '${day.day}',
                    style: TextStyle(fontSize: 13.82.sp, fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ),
              ),
            );
          });
        },
      ),

      calendarStyle: CalendarStyle(
        cellMargin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),

        // TextStyle
        defaultTextStyle: TextStyle(fontSize: 13.82.sp, fontWeight: FontWeight.w600, color: AppColor.coolGray100),
        outsideTextStyle: TextStyle(fontSize: 13.82.sp, fontWeight: FontWeight.w600, color: AppColor.gray3),
        weekendTextStyle: TextStyle(fontSize: 13.82.sp, fontWeight: FontWeight.w600, color: const Color(0xFF5C5F64)),
        withinRangeTextStyle: TextStyle(fontSize: 13.82.sp, fontWeight: FontWeight.w600, color: const Color(0xFF02B2FF)),
        selectedTextStyle: TextStyle(fontSize: 13.82.sp, fontWeight: FontWeight.w600, color: Colors.black),
        todayTextStyle: TextStyle(fontSize: 13.82.sp, fontWeight: FontWeight.w500, color: const Color(0xFF5C5F64)),

        // Decoration

        // Avoid rendering error
        // Reference: https://github.com/aleksanderwozniak/table_calendar/issues/583
        defaultDecoration: const BoxDecoration(shape: BoxShape.rectangle),
        disabledDecoration: const BoxDecoration(shape: BoxShape.rectangle),
        holidayDecoration: const BoxDecoration(shape: BoxShape.rectangle),
        markerDecoration: const BoxDecoration(shape: BoxShape.rectangle),
        outsideDecoration: const BoxDecoration(shape: BoxShape.rectangle),
        rowDecoration: const BoxDecoration(shape: BoxShape.rectangle),
        todayDecoration: const BoxDecoration(shape: BoxShape.rectangle),
        selectedDecoration: const BoxDecoration(shape: BoxShape.rectangle),
        weekendDecoration: const BoxDecoration(shape: BoxShape.rectangle),
        withinRangeDecoration: const BoxDecoration(shape: BoxShape.rectangle),
      ),

      // Event
      selectedDayPredicate: (day) => isSameDay(selectedDay, day),
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          this.selectedDay = selectedDay;
          this.focusedDay = focusedDay;
        });
      },

      onPageChanged: (focusedDay) {
        setState(() {
          focusedDay = focusedDay;
        });
      },
    );
  }
}
