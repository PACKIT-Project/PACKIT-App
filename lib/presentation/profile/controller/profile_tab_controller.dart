import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController with GetSingleTickerProviderStateMixin {
  late final TabController tabController;

  final List<Tab> tabs = [const Tab(text: '내 여행'), const Tab(text: '게시글')];
  final RxInt tabIndex = 0.obs;
  final RxInt travelTabIndex = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
  }
}
