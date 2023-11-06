import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final TextEditingController nickNameTextController = TextEditingController();
  final FocusNode textFieldFocus = FocusNode();

  RxBool isFocus = false.obs;
  RxBool isNickValid = false.obs;
  RxBool isValidatorEnable = false.obs;

  @override
  void onClose() {
    nickNameTextController.dispose();
    super.onClose();
  }
}
