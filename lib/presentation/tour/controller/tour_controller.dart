import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TourController extends GetxController {
  final TextEditingController regionTextController = TextEditingController();
  final TextEditingController tourTitleTextController = TextEditingController();
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
