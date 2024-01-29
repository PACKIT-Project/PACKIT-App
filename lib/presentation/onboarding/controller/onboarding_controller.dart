import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/app/extension/input_validate.dart';
import 'package:packit/app/service/auth_service.dart';
import 'package:packit/app/util/image_util.dart';
import 'package:packit/domain/entities/check_nick_response.dart';
import 'package:packit/domain/entities/image_response.dart';
import 'package:packit/domain/entities/packit_member_entity.dart';
import 'package:packit/domain/entities/packit_register_entity.dart';
import 'package:packit/domain/entities/packit_response.dart';
import 'package:packit/domain/entities/register_response.dart';
import 'package:packit/domain/usecases/member_use_cases.dart';

class OnboardingController extends GetxController {
  final MemberUseCases memberUseCases = Get.find<MemberUseCases>();

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

  Future<void> validateNickname() async {
    if (nickNameTextController.text.length >= 2) {
      isValidatorEnable.value = true;
      if (nickNameTextController.text.isValidNick()) {
        PackitResponse<CheckNickResponse> response = await memberUseCases.checkNickname.execute(nickNameTextController.text);
        if (!response.data.isDuplicated) {
          isNickValid.value = true;
        } else {
          isNickValid.value = false;
        }
      } else {
        isNickValid.value = false;
      }
    } else {
      isValidatorEnable.value = false;
      isNickValid.value = false;
    }
  }

  Future<void> setProfileImage() async {
    XFile? profileImage = await ImageUtil.instance.getImageFromGallery();
    PackitResponse<ImageResponse>? response = await ImageUtil.instance.uploadImage(profileImage!);

    if (response != null) {
      this.profileImage.value = profileImage;
      profileImageUrl = response.data.savedImageUrl;
    }
  }

  // Register
  Future<void> register() async {
    try {
      PackitResponse<RegisterResponse> response = await memberUseCases.register.execute(PackitRegisterEntity(
        nickname: nickNameTextController.text,
        profileImageUrl: profileImageUrl,
        checkTerms: isTermChecked.value,
        enableNotification: isPushChecked.value,
      ));

      AuthService.to.member = PackitMemberEntity(
        id: response.data.memberId,
        nickname: nickNameTextController.text,
        profileImageUrl: profileImageUrl,
        enableNotification: isPushChecked.value,
      );

      // Get.offAllNamed(RoutePath.home);
    } catch (e) {
      if (kDebugMode) print(e);
    }
  }

  @override
  void onClose() {
    nickNameTextController.dispose();
    super.onClose();
  }
}
