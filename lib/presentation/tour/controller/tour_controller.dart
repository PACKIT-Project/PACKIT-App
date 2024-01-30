import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:packit/domain/entities/destination_response.dart';
import 'package:packit/domain/entities/packit_response.dart';
import 'package:packit/domain/usecases/destination_use_cases.dart';

class TourController extends GetxController {
  final DestinationUseCases destinationUseCases = Get.find<DestinationUseCases>();

  final TextEditingController regionTextController = TextEditingController();
  final TextEditingController tourTitleTextController = TextEditingController();
  final FocusNode textFieldFocus = FocusNode();

  RxList<DestinationResponse> searchResultList = <DestinationResponse>[].obs;

  RxString selectedRegion = "".obs;
  RxBool isFocus = false.obs;

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

  @override
  void onClose() {
    regionTextController.dispose();
    textFieldFocus.dispose();
    super.onClose();
  }
}
