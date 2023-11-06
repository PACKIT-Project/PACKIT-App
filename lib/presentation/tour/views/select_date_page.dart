import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/presentation/widget/packit_button.dart';

import '../controller/calendar_controller.dart';
import '../widget/calendar_widget.dart';

class SelectDatePage extends StatelessWidget {
  const SelectDatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15.67.w, 19.h, 23.5.w, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset('assets/icons/arrow_back.svg', width: 24.w, height: 24.h),
                  ),
                  Row(
                    children: [
                      Text("2", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: const Color(0xFF02B2FF))),
                      Text("/3", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: const Color(0xFF6B7684))),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.67.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const Text("언제 여행을\n떠나시나요?", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700)),
            ),
            SizedBox(height: 28.8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 37.w, vertical: 10.h),
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
      bottomNavigationBar: SafeArea(
        child: GetX<CalendarController>(
          builder: (controller) {
            bool isDateSelected = controller.rangeStart.value != null && controller.rangeEnd.value != null;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 28.69.h),
              child: PackitButton(
                "다음",
                onTap: isDateSelected ? () => Get.toNamed(RoutePath.selectParty) : null,
                color: isDateSelected ? const Color(0xFF02B2FF) : const Color(0xFFBFEBFF),
              ),
            );
          },
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
