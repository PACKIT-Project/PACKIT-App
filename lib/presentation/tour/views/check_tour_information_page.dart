import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:packit/presentation/widget/packit_button.dart';

import '../controller/calendar_controller.dart';
import '../controller/tour_controller.dart';

class CheckTourInformationPage extends StatelessWidget {
  CheckTourInformationPage({super.key});

  final _tourController = Get.find<TourController>();
  final _calendarController = Get.find<CalendarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.67.w, top: 19.h),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset('assets/icons/arrow_back.svg', width: 24.w, height: 24.h),
              ),
            ),
            SizedBox(height: 29.68.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        _tourController.selectedRegion.value,
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF02B2FF),
                          decoration: TextDecoration.underline,
                          decorationColor: const Color(0xFF02B2FF),
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
                          color: const Color(0xFF02B2FF),
                          decoration: TextDecoration.underline,
                          decorationColor: const Color(0xFF02B2FF),
                        ),
                      ),
                      Text(" 까지", style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700))
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "${_calendarController.rangeEnd.value!.difference(_calendarController.rangeStart.value!).inDays}박 ${_calendarController.rangeEnd.value!.difference(_calendarController.rangeStart.value!).inDays + 1}일",
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF02B2FF),
                          decoration: TextDecoration.underline,
                          decorationColor: const Color(0xFF02B2FF),
                        ),
                      ),
                      Text(" 여행을", style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700))
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "${_tourController.selectedPartyNumber.value}명",
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF02B2FF),
                          decoration: TextDecoration.underline,
                          decorationColor: const Color(0xFF02B2FF),
                        ),
                      ),
                      Text(" 의 인원으로 떠나시나요?", style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 28.69.h),
          child: PackitButton(
            "여행 생성 완료하기",
            onTap: () => Get.toNamed("/tour/complete"),
          ),
        ),
      ),
    );
  }
}
