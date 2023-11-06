import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TourController extends GetxController with GetSingleTickerProviderStateMixin {
  final TextEditingController regionTextController = TextEditingController();
  final FocusNode textFieldFocus = FocusNode();

  RxString selectedRegion = "".obs;

  RxBool isFocus = false.obs;
  RxBool isRegionExist = false.obs;

  @override
  void onClose() {
    regionTextController.dispose();
    textFieldFocus.dispose();
    super.onClose();
  }
}
