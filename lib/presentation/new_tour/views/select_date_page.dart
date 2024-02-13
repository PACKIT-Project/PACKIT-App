import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/presentation/widget/packit_appbar.dart';
import 'package:packit/presentation/widget/packit_button.dart';

import '../controller/calendar_controller.dart';
import '../widget/calendar_widget.dart';

class SelectDatePage extends StatelessWidget {
  const SelectDatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PackitBackAppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 11.64.w),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("언제 여행을\n떠나시나요?", style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700)),
                  const Spacer(),
                  Row(
                    children: [
                      Text("2", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: AppColor.mainBlue)),
                      Text("/3", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: const Color(0xFF6B7684))),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 29.81.w),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 37.w, vertical: 10.w),
              child: Column(
                children: [
                  const CalendarWidget(),
                  SizedBox(height: 16.w),
                  Divider(height: 1.w, color: const Color(0xFFDBDBDB)),
                  SizedBox(height: 23.33.w),
                  const _FromToWidget(),
                ],
              ),
            ),
            const Spacer(),
            GetX<CalendarController>(
              builder: (controller) {
                bool isDateSelected = controller.rangeStart.value != null && controller.rangeEnd.value != null;

                return PackitButton("다음", onTap: isDateSelected ? () => Get.toNamed(RoutePath.checkTourInformation) : null);
              },
            ),
            SizedBox(height: 28.w),
          ],
        ),
      ),
    );
  }
}

class _FromToWidget extends GetView<CalendarController> {
  const _FromToWidget();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  "부터",
                  style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, color: const Color(0xFF9B9EA5)),
                ),
                SizedBox(height: 5.67.h),
                if (controller.rangeStart.value != null) ...[
                  Text(
                    DateFormat('MM월 dd일 (E)').format(controller.rangeStart.value!),
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                ] else ...[
                  Text('', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
                ],
              ],
            ),
          ),
          Text("/", style: TextStyle(fontSize: 18.sp, color: const Color(0xFF9B9EA5))),
          Expanded(
            child: Column(
              children: [
                Text(
                  "까지",
                  style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, color: const Color(0xFF9B9EA5)),
                ),
                SizedBox(height: 5.67.h),
                if (controller.rangeEnd.value != null) ...[
                  Text(
                    DateFormat('MM월 dd일 (E)').format(controller.rangeEnd.value!),
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                ] else ...[
                  Text('', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
                ],
              ],
            ),
          ),
        ],
      );
    });
  }
}
