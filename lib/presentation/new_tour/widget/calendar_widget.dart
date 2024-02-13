import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controller/calendar_controller.dart';

class CalendarWidget extends GetView<CalendarController> {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TableCalendar(
        calendarFormat: CalendarFormat.month,
        rangeSelectionMode: RangeSelectionMode.enforced,
        rowHeight: 46.h,

        focusedDay: controller.focusedDay.value,
        firstDay: DateTime(2010, 1, 1),
        lastDay: DateTime(2099, 12, 31),
        rangeStartDay: controller.rangeStart.value,
        rangeEndDay: controller.rangeEnd.value,

        // Header
        headerStyle: HeaderStyle(
          headerPadding: EdgeInsets.only(bottom: 20.h),
          formatButtonVisible: false,

          // Title
          titleCentered: true,
          titleTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: const Color(0xFF404244)),

          // Chevron
          leftChevronIcon: const Icon(Icons.chevron_left, color: Colors.black),
          rightChevronIcon: const Icon(Icons.chevron_right, color: Colors.black),
          leftChevronPadding: EdgeInsets.zero,
          rightChevronPadding: EdgeInsets.zero,
        ),

        // Days of Week
        daysOfWeekHeight: 48.h,
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            color: const Color(0xFF9B9EA5),
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
          weekendStyle: TextStyle(
            color: const Color(0xFF9B9EA5),
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),

        // Calendar
        calendarBuilders: CalendarBuilders(
          rangeHighlightBuilder: (context, day, isWithinRange) {
            if (isWithinRange) {
              return LayoutBuilder(builder: (context, constraints) {
                final isRangeStart = isSameDay(day, controller.rangeStart.value);
                final isRangeEnd = isSameDay(day, controller.rangeEnd.value);

                final isSat = day.weekday == 6;
                final isSun = day.weekday == 7;

                return Center(
                  child: Container(
                    height: (constraints.maxHeight - 6.h),
                    margin: EdgeInsetsDirectional.only(
                      start: isRangeStart ? constraints.maxWidth * 0.5 : 0.0,
                      end: isRangeEnd ? constraints.maxWidth * 0.5 : 0.0,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0F6FF),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                        topLeft: isSun ? const Radius.circular(16) : Radius.zero,
                        bottomLeft: isSun ? const Radius.circular(16) : Radius.zero,
                        topRight: isSat ? const Radius.circular(16) : Radius.zero,
                        bottomRight: isSat ? const Radius.circular(16) : Radius.zero,
                      ),
                    ),
                  ),
                );
              });
            }
            return null;
          },
        ),
        calendarStyle: CalendarStyle(
          cellMargin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),

          // TextStyle
          defaultTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: const Color(0xFF5C5F64)),
          outsideTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: const Color(0xFFDBDBDB)),
          weekendTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: const Color(0xFF5C5F64)),
          rangeStartTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.white),
          rangeEndTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.white),
          withinRangeTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: const Color(0xFF02B2FF)),
          todayTextStyle: controller.isTodayInRange.value
              ? TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: const Color(0xFF02B2FF))
              : TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: const Color(0xFF5C5F64)),

          // Decoration
          rangeStartDecoration: BoxDecoration(
            color: const Color(0xFF02B2FF),
            borderRadius: BorderRadius.circular(16),
          ),
          rangeEndDecoration: BoxDecoration(
            color: const Color(0xFF02B2FF),
            borderRadius: BorderRadius.circular(16),
          ),

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
        onRangeSelected: (start, end, focusedDay) {
          controller.rangeStart.value = start;
          controller.rangeEnd.value = end;

          if (controller.rangeStart.value != null && controller.rangeEnd.value != null) {
            controller.isTodayInRange.value =
                controller.rangeStart.value!.isBefore(DateTime.now()) && controller.rangeEnd.value!.isAfter(DateTime.now());
          } else {
            controller.isTodayInRange.value = false;
          }
        },
        onPageChanged: (focusedDay) => controller.focusedDay.value = focusedDay,
      );
    });
  }
}
