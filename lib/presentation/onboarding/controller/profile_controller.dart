import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final TextEditingController nickNameTextController = TextEditingController();
  final FocusNode nickNameTextFocus = FocusNode();

  RxBool isFocus = false.obs;
  RxBool isNickValid = false.obs;
  RxBool isValidatorEnable = false.obs;

  @override
  void onClose() {
    nickNameTextController.dispose();
    nickNameTextFocus.dispose();
    super.onClose();
  }
}
