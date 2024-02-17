import 'package:flutter/material.dart';
import 'package:packit/presentation/widget/packit_appbar.dart';
import 'package:packit/presentation/widget/packit_setting_switch.dart';

class TravelRemindPage extends StatelessWidget {
  const TravelRemindPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PackitBackAppBar(title: "여행 리마인드"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PackitSettingSwitch(
            title: "여행 리마인드 알림",
            description: "설정된 날짜와 시간에 맞추어 \n여행 리마인드 알림을 전송합니다.",
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
