import 'package:get/get.dart';

import '../entities/packit_empty_response.dart';
import '../entities/packit_new_travel_entity.dart';
import '../entities/packit_response.dart';
import '../entities/travel_response.dart';
import '../repositories/travel_repository.dart';

class TravelUseCases {
  final TravelRepository _repository = Get.find<TravelRepository>();

  DeleteTravelUseCase get deleteTravelUseCase => DeleteTravelUseCase(_repository);
  GetPastTravelsUseCase get getPastTravelsUseCase => GetPastTravelsUseCase(_repository);
  GetUpcomingTravelsUseCase get getUpcomingTravelsUseCase => GetUpcomingTravelsUseCase(_repository);
  NewTravelUseCase get newTravelUseCase => NewTravelUseCase(_repository);
}

class DeleteTravelUseCase {
  final TravelRepository _repository;
  DeleteTravelUseCase(this._repository);

  Future<PackitEmptyResponse> execute(int travelId) async {
    return await _repository.deleteTravel(travelId);
  }
}

class GetPastTravelsUseCase {
  final TravelRepository _repository;
  GetPastTravelsUseCase(this._repository);

  Future<PackitResponse<List<TravelResponse>>> execute() async {
    return await _repository.getPastTravels();
  }
}

class GetUpcomingTravelsUseCase {
  final TravelRepository _repository;
  GetUpcomingTravelsUseCase(this._repository);

  Future<PackitResponse<List<TravelResponse>>> execute() async {
    return await _repository.getUpcomingTravels();
  }
}

class NewTravelUseCase {
  final TravelRepository _repository;
  NewTravelUseCase(this._repository);

  Future<PackitResponse<int>> execute(PackitNewTravelEntity newTravelEntity) async {
    return await _repository.newTravel(newTravelEntity);
  }
}
