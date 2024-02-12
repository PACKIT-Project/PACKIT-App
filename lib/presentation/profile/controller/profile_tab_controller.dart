import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:packit/domain/entities/invitation_response.dart';
import 'package:packit/domain/usecases/travel_use_cases.dart';

class ProfileController extends GetxController with GetSingleTickerProviderStateMixin {
  final TravelUseCases travelUseCases = Get.find<TravelUseCases>();

  late final TabController tabController;

  final List<Tab> tabs = [const Tab(text: '내 여행'), const Tab(text: '게시글')];
  final RxInt tabIndex = 0.obs;
  final RxInt travelTabIndex = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  Future<InvitationResponse> getInvitationInfo(int travelId) async {
    try {
      return (await travelUseCases.getInvitationInfoUseCase.execute(travelId)).data;
    } catch (e) {
      if (kDebugMode) print(e);
      rethrow;
    }
  }

  Future<void> inviteKakao(String invitationCode) async {
    final TextTemplate defaultText = TextTemplate(
      text: "Packit에서 여행 친구를 초대합니다.\n여행 친구는 최대 8명까지 초대가 가능합니다.\n여행 친구를 초대하여 함께 여행을 떠나보세요!\nPackit 초대코드 : $invitationCode",
      link: Link(webUrl: Uri.parse("https://packit.co.kr/"), mobileWebUrl: Uri.parse("https://packit.co.kr/")),
    );

    if (await ShareClient.instance.isKakaoTalkSharingAvailable()) {
      try {
        Uri uri = await ShareClient.instance.shareDefault(template: defaultText);
        await ShareClient.instance.launchKakaoTalk(uri);
      } catch (e) {
        if (kDebugMode) print(e);
      }
    } else {
      try {
        Uri shareUrl = await WebSharerClient.instance.makeDefaultUrl(template: defaultText);
        await launchBrowserTab(shareUrl, popupOpen: true);
      } catch (e) {
        if (kDebugMode) print(e);
      }
    }
  }
}
