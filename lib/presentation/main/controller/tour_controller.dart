import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:packit/domain/entities/travel_response.dart';
import 'package:packit/domain/usecases/travel_use_cases.dart';

class TourController extends GetxController {
  final TravelUseCases travelUseCases = Get.find<TravelUseCases>();

  RxList<TravelResponse> pastTravelList = <TravelResponse>[].obs;
  RxList<TravelResponse> upcomingTravelList = <TravelResponse>[].obs;

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
  }
}
