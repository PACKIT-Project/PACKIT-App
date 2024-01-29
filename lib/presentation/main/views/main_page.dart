import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:packit/presentation/main/widget/packit_bottom_nav_bar.dart';

import '../controller/main_controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(index: controller.currentIndex, children: controller.pages),
      ),
      bottomNavigationBar: const PackitBottomNavBar(),
    );
  }
}
