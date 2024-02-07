import 'package:get/get.dart';

import '../entities/packit_new_travel_entity.dart';
import '../entities/packit_response.dart';
import '../repositories/travel_repository.dart';

class TravelUseCases {
  final TravelRepository _repository = Get.find<TravelRepository>();

  NewTravelUseCase get newTravelUseCase => NewTravelUseCase(_repository);
}

class NewTravelUseCase {
  final TravelRepository _repository;
  NewTravelUseCase(this._repository);

  Future<PackitResponse<int>> execute(PackitNewTravelEntity newTravelEntity) async {
    return await _repository.newTravel(newTravelEntity);
  }
}
