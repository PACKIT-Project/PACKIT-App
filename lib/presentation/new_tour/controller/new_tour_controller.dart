import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/domain/entities/destination_response.dart';
import 'package:packit/domain/entities/packit_new_travel_entity.dart';
import 'package:packit/domain/entities/packit_response.dart';
import 'package:packit/domain/usecases/destination_use_cases.dart';
import 'package:packit/domain/usecases/travel_use_cases.dart';
import 'package:packit/presentation/new_tour/controller/calendar_controller.dart';

class NewTourController extends GetxController {
  final DestinationUseCases destinationUseCases = Get.find<DestinationUseCases>();
  final TravelUseCases newTravelUseCases = Get.find<TravelUseCases>();

  final TextEditingController regionTextController = TextEditingController();
  final TextEditingController tourTitleTextController = TextEditingController();
  final FocusNode textFieldFocus = FocusNode();

  RxList<DestinationResponse> searchResultList = <DestinationResponse>[].obs;

  RxString selectedRegion = "".obs;
  int selectedRegionId = 0;
  RxBool isFocus = false.obs;

  bool isLoading = false;

  Future<void> searchDestination() async {
    if (regionTextController.text.isNotEmpty) {
      try {
        PackitResponse<List<DestinationResponse>> response = await destinationUseCases.searchDestination.execute(regionTextController.text);

        searchResultList.assignAll(response.data);
      } catch (e) {
        if (kDebugMode) print(e);
      }
    } else {
      searchResultList.clear();
    }
  }

  Future<void> postNewTravel() async {
    if (isLoading) return;

    final CalendarController calendarController = Get.find<CalendarController>();

    isLoading = true;
    try {
      await newTravelUseCases.newTravelUseCase.execute(
        PackitNewTravelEntity(
          title: tourTitleTextController.text,
          destinationId: selectedRegionId,
          startDate: calendarController.rangeStart.value!,
          endDate: calendarController.rangeEnd.value!,
        ),
      );

      Get.offNamedUntil(RoutePath.main, ModalRoute.withName(RoutePath.main));
    } catch (e) {
      if (kDebugMode) print(e);
    } finally {
      isLoading = false;
    }
  }

  @override
  void onClose() {
    regionTextController.dispose();
    textFieldFocus.dispose();
    super.onClose();
  }
}
