import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:packit/app/util/image_util.dart';
import 'package:packit/domain/entities/image_response.dart';
import 'package:packit/domain/entities/packit_response.dart';

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
  final Rx<XFile?> profileImage = XFile("").obs;
  String profileImageUrl = "";

  final TextEditingController nickNameTextController = TextEditingController();
  final FocusNode textFieldFocus = FocusNode();

  RxBool isFocus = false.obs;
  RxBool isNickValid = false.obs;
  RxBool isValidatorEnable = false.obs;

  Future<void> setProfileImage() async {
    XFile? profileImage = await ImageUtil.instance.getImageFromGallery();
    PackitResponse<ImageResponse>? response = await ImageUtil.instance.uploadImage(profileImage!);

    if (response != null) {
      this.profileImage.value = profileImage;
      profileImageUrl = response.data.savedImageUrl;
    }
  }

  @override
  void onClose() {
    nickNameTextController.dispose();
    super.onClose();
  }
}
