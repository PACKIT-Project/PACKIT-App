import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  // Term
  bool get isAllChecked => isPrivacyChecked.value && isTermChecked.value && isPushChecked.value;
  bool get isRequiredChecked => isPrivacyChecked.value && isTermChecked.value;

  RxBool isPrivacyChecked = false.obs;
  RxBool isTermChecked = false.obs;
  RxBool isPushChecked = false.obs;

  void setAllChecked() {
    if (!isAllChecked) {
      isPrivacyChecked.value = true;
      isTermChecked.value = true;
      isPushChecked.value = true;
    } else {
      isPrivacyChecked.value = false;
      isTermChecked.value = false;
      isPushChecked.value = false;
    }
  }

  // Profile
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
