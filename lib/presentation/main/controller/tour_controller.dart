import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:packit/domain/entities/check_list_response.dart';
import 'package:packit/domain/entities/packit_item_entity.dart';
import 'package:packit/domain/entities/travel_member_response.dart';
import 'package:packit/domain/entities/travel_response.dart';
import 'package:packit/domain/usecases/item_use_cases.dart';
import 'package:packit/domain/usecases/travel_use_cases.dart';
import 'package:packit/presentation/widget/packit_bottom_sheet.dart';

class TourController extends GetxController {
  final TravelUseCases travelUseCases = Get.find<TravelUseCases>();

  final ItemUseCases itemUseCases = Get.find<ItemUseCases>();

  final RxList<TravelResponse> pastTravelList = <TravelResponse>[].obs;
  final RxList<TravelResponse> upcomingTravelList = <TravelResponse>[].obs;

  final Rx<TravelResponse?> selectedTravel = Rx<TravelResponse?>(null);
  final Rx<CheckListResponse?> selectedCheckList = Rx<CheckListResponse?>(null);

  final RxList<TravelMemberResponse> travelMemberList = <TravelMemberResponse>[].obs;

  final RxInt selectedClusterIndex = 0.obs;
  final RxInt selectedCategoryIndex = 0.obs;
  final RxInt selectedItemIndex = 0.obs;

  Future<void> createItem(int categoryId, String title) async {
    try {
      await itemUseCases.createItem.execute(PackitItemPostEntity(categoryId: categoryId, title: title));
      await getMyCheckList(selectedTravel.value!.id);
    } catch (e) {
      if (kDebugMode) print(e);
    }
  }

  Future<void> checkItem(int itemId, bool isChecked) async {
    try {
      if (isChecked) {
        await itemUseCases.unCheckItem.execute(itemId);
      } else {
        await itemUseCases.checkItem.execute(itemId);
      }
      await getMyCheckList(selectedTravel.value!.id);
      await getTravelMembers(selectedTravel.value!.id);

      if (travelMemberList[0].checkedNum != 0 && travelMemberList[0].unCheckedNum == 0) {
        await showPackitBottomSheet(Get.context!, PackitBottomSheetType.completeCheckList);
      }
    } catch (e) {
      if (kDebugMode) print(e);
    }
  }

  Future<void> deleteTravel(int travelId) async {
    try {
      await travelUseCases.deleteTravelUseCase.execute(travelId);

      pastTravelList.removeWhere((element) => element.id == travelId);
      upcomingTravelList.removeWhere((element) => element.id == travelId);

      pastTravelList.refresh();
      upcomingTravelList.refresh();
    } catch (e) {
      if (kDebugMode) print(e);
      rethrow;
    }
  }

  Future<void> getMemberCheckList(int travelId, int memberId) async {
    try {
      CheckListResponse response = (await travelUseCases.getMemberCheckListUseCase.execute(travelId, memberId)).data;

      selectedCheckList.value = response;
    } catch (e) {
      if (kDebugMode) print(e);
    }
  }

  Future<void> getMyCheckList(int travelId) async {
    try {
      CheckListResponse response = (await travelUseCases.getMyCheckListUseCase.execute(travelId)).data;
      selectedCheckList.value = response;
    } catch (e) {
      if (kDebugMode) print(e);
    }
  }

  Future<void> getTravelMembers(int travelId) async {
    try {
      List<TravelMemberResponse> response = (await travelUseCases.getTravelMembersUseCase.execute(travelId)).data;
      travelMemberList.assignAll(response);
    } catch (e) {
      if (kDebugMode) print(e);
    }
  }

  Future<void> getPastTravels() async {
    try {
      List<TravelResponse> response = (await travelUseCases.getPastTravelsUseCase.execute()).data;
      pastTravelList.assignAll(response);
    } catch (e) {
      if (kDebugMode) print(e);
    }
  }

  Future<void> getUpcomingTravels() async {
    try {
      List<TravelResponse> response = (await travelUseCases.getUpcomingTravelsUseCase.execute()).data;
      upcomingTravelList.assignAll(response);
    } catch (e) {
      if (kDebugMode) print(e);
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await getPastTravels();
    await getUpcomingTravels();

    ever(selectedTravel, (TravelResponse? travel) async {
      if (travel != null) {
        await getTravelMembers(travel.id);
        await getMyCheckList(travel.id);
      }
    });

    if (upcomingTravelList.isNotEmpty) {
      selectedTravel.value = upcomingTravelList.first;
    } else if (pastTravelList.isNotEmpty) {
      selectedTravel.value = pastTravelList.first;
    }
  }
}
