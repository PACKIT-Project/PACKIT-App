import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:packit/app/config/app_binding.dart';
import 'package:packit/app/config/app_route.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Pretendard',
        useMaterial3: true,
      ),
      initialBinding: AppBinding(),
      initialRoute: AppRoute.login,
      getPages: AppRoute.routes,
    );
  }
}
