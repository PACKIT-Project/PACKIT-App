import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final TextEditingController nickNameTextController = TextEditingController();
  final FocusNode nickNameTextFocus = FocusNode();

  RxBool isFocus = false.obs;
  RxBool isNickEmpty = true.obs;

  @override
  void onClose() {
    nickNameTextController.dispose();
    nickNameTextFocus.dispose();
    super.onClose();
  }
}
