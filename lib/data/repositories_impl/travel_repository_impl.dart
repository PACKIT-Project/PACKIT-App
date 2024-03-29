import 'package:get/get.dart';
import 'package:packit/domain/entities/invitation_response.dart';

import 'package:packit/domain/entities/packit_empty_response.dart';
import 'package:packit/domain/entities/packit_new_travel_entity.dart';
import 'package:packit/domain/entities/packit_response.dart';
import 'package:packit/domain/entities/travel_response.dart';
import 'package:packit/domain/repositories/travel_repository.dart';

import '../datasources/remote/travel_api.dart';
import '../models/invitation_response_model.dart';
import '../models/packit_empty_response_model.dart';
import '../models/packit_response_model.dart';
import '../models/travel_response_model.dart';
import 'mappers/travel_mappr.dart';

final TravelMappr _mappr = TravelMappr();

class TravelRepositoryImpl extends TravelRepository {
  final TravelAPI _api = Get.find();

  @override
  Future<PackitEmptyResponse> deleteTravel(int travelId) async {
    PackitEmptyResponseModel response = await _api.deleteTravel(travelId);

    return _mappr.convert<PackitEmptyResponseModel, PackitEmptyResponse>(response);
  }

  @override
  Future<PackitResponse<InvitationResponse>> getInvitationInfo(int travelId) async {
    PackitResponseModel<InvitationResponseModel> response = await _api.getInvitationInfo(travelId);

    return _mappr.convert<PackitResponseModel<InvitationResponseModel>, PackitResponse<InvitationResponse>>(response);
  }

  @override
  Future<PackitResponse<List<TravelResponse>>> getPastTravels() async {
    PackitResponseModel<List<TravelResponseModel>> response = await _api.getPastTravels();

    return _mappr.convert<PackitResponseModel<List<TravelResponseModel>>, PackitResponse<List<TravelResponse>>>(response);
  }

  @override
  Future<PackitResponse<List<TravelResponse>>> getUpcomingTravels() async {
    PackitResponseModel<List<TravelResponseModel>> response = await _api.getUpcomingTravels();

    return _mappr.convert<PackitResponseModel<List<TravelResponseModel>>, PackitResponse<List<TravelResponse>>>(response);
  }

  @override
  Future<PackitResponse<int>> newTravel(PackitNewTravelEntity newTravelEntity) async {
    PackitResponseModel<int> response = await _api.newTravel(newTravelEntity);

    return _mappr.convert<PackitResponseModel<int>, PackitResponse<int>>(response);
  }
}
