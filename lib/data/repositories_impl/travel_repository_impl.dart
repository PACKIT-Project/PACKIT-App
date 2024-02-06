import 'package:get/get.dart';
import 'package:packit/data/repositories_impl/mappers/travel_mappr.dart';

import 'package:packit/domain/entities/packit_new_travel_entity.dart';
import 'package:packit/domain/entities/packit_response.dart';
import 'package:packit/domain/repositories/travel_repository.dart';

import '../datasources/remote/travel_api.dart';
import '../models/packit_response_model.dart';

final TravelMappr _mappr = TravelMappr();

class TravelRepositoryImpl extends TravelRepository {
  final TravelAPI _api = Get.find();

  @override
  Future<PackitResponse<int>> newTravel(PackitNewTravelEntity newTravelEntity) async {
    PackitResponseModel<int> response = await _api.searchDestination(newTravelEntity);

    return _mappr.convert<PackitResponseModel<int>, PackitResponse<int>>(response);
  }
}
