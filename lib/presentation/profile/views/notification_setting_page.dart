import 'package:flutter/material.dart';
import 'package:packit/presentation/widget/packit_appbar.dart';
import 'package:packit/presentation/widget/packit_setting_switch.dart';

class NotificationSettingPage extends StatelessWidget {
  const NotificationSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PackitBackAppBar(title: "앱 알림 설정"),
      body: Column(children: [
        PackitSettingSwitch(title: "활동 알림", description: "모든 여행의 할 일 완료, 재촉 등 알림", onChanged: (value) {}),
        PackitSettingSwitch(title: "전체 여행 리마인드 알림", description: "설정한 전체 여행 리마인드 알림", onChanged: (value) {}),
      ]),
    );
  }
}
