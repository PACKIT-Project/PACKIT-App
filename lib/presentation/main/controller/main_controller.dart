import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:packit/presentation/home/views/home_view.dart';
import 'package:packit/presentation/profile/views/profile_view.dart';

class MainController extends GetxController {
  final List<Widget> pages = [
    const HomeView(),
    const HomeView(),
    const ProfileView(),
  ];

  final RxInt _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;

  void changeCurrentIndex(int index) {
    _currentIndex.value = index;
    update();
  }
}
