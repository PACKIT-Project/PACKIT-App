import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/calendar_controller.dart';
import '../widget/calendar_widget.dart';

class SelectDatePage extends StatelessWidget {
  const SelectDatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 13.h),
            const Text("언제 여행을 떠나시나요?", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600)),
            SizedBox(height: 23.64.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: Column(
                children: [
                  const CalendarWidget(),
                  SizedBox(height: 16.h),
                  Divider(height: 1.h, color: const Color(0xFFDBDBDB)),
                  SizedBox(height: 23.64.h),
                  const _FromToWidget(),
                ],
              ),
            ),
            const Spacer(),
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
