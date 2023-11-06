import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TourController extends GetxController {
  final TextEditingController regionTextController = TextEditingController();
  final FocusNode textFieldFocus = FocusNode();

  RxInt modalPartyNumber = 2.obs;
  RxInt selectedPartyNumber = 1.obs;
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
