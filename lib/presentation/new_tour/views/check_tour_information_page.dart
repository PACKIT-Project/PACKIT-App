import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:packit/app/extension/travel_date.dart';
import 'package:packit/presentation/widget/packit_appbar.dart';
import 'package:packit/presentation/widget/packit_button.dart';

import '../controller/calendar_controller.dart';
import '../controller/new_tour_controller.dart';

class CheckTourInformationPage extends StatelessWidget {
  CheckTourInformationPage({super.key});

  final _tourController = Get.find<NewTourController>();
  final _calendarController = Get.find<CalendarController>();

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
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          _tourController.selectedRegion.value,
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColor.mainBlue,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColor.mainBlue,
                          ),
                        ),
                        Text(" 로", style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700))
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "${DateFormat('yy.MM.dd').format(_calendarController.rangeStart.value!)} ~ ${DateFormat('yy.MM.dd').format(_calendarController.rangeEnd.value!)}",
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColor.mainBlue,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColor.mainBlue,
                          ),
                        ),
                        Text(" 까지", style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700))
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          _calendarController.rangeEnd.value!.toNDayString(_calendarController.rangeStart.value!),
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColor.mainBlue,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColor.mainBlue,
                          ),
                        ),
                        Text(" 여행을 떠나시나요?", style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            PackitButton(
              "여행 생성하기",
              onTap: () async => await _tourController.postNewTravel(),
            ),
            SizedBox(height: 28.w),
          ],
        ),
      ),
    );
  }
}
