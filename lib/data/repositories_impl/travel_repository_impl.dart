import 'package:get/get.dart';

import 'package:packit/domain/entities/check_list_response.dart';
import 'package:packit/domain/entities/invitation_response.dart';
import 'package:packit/domain/entities/packit_empty_response.dart';
import 'package:packit/domain/entities/packit_new_travel_entity.dart';
import 'package:packit/domain/entities/packit_response.dart';
import 'package:packit/domain/entities/travel_member_response.dart';
import 'package:packit/domain/entities/travel_response.dart';
import 'package:packit/domain/repositories/travel_repository.dart';

import '../datasources/remote/travel_api.dart';
import '../models/check_list_response_model.dart';
import '../models/invitation_response_model.dart';
import '../models/packit_empty_response_model.dart';
import '../models/packit_response_model.dart';
import '../models/travel_member_response_model.dart';
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
  Future<PackitResponse<CheckListResponse>> getMemberCheckList(int travelId, int memberId) async {
    final PackitResponseModel<CheckListResponseModel> response = await _api.getMemberCheckList(travelId, memberId);

    return _mappr.convert<PackitResponseModel<CheckListResponseModel>, PackitResponse<CheckListResponse>>(response);
  }

  @override
  Future<PackitResponse<CheckListResponse>> getMyCheckList(int travelId) async {
    final PackitResponseModel<CheckListResponseModel> response = await _api.getMyCheckList(travelId);

    return _mappr.convert<PackitResponseModel<CheckListResponseModel>, PackitResponse<CheckListResponse>>(response);
  }

  @override
  Future<PackitResponse<List<TravelResponse>>> getPastTravels() async {
    PackitResponseModel<List<TravelResponseModel>> response = await _api.getPastTravels();

    return _mappr.convert<PackitResponseModel<List<TravelResponseModel>>, PackitResponse<List<TravelResponse>>>(response);
  }

  @override
  Future<PackitResponse<TravelResponse>> getTravel(int travelId) async {
    PackitResponseModel<TravelResponseModel> response = await _api.getTravel(travelId);

    return _mappr.convert<PackitResponseModel<TravelResponseModel>, PackitResponse<TravelResponse>>(response);
  }

  @override
  Future<PackitResponse<List<TravelMemberResponse>>> getTravelMembers(int travelId) async {
    PackitResponseModel<List<TravelMemberResponseModel>> response = await _api.getTravelMembers(travelId);

    return _mappr.convert<PackitResponseModel<List<TravelMemberResponseModel>>, PackitResponse<List<TravelMemberResponse>>>(response);
  }

  @override
  Future<PackitResponse<List<TravelResponse>>> getUpcomingTravels() async {
    PackitResponseModel<List<TravelResponseModel>> response = await _api.getUpcomingTravels();

    return _mappr.convert<PackitResponseModel<List<TravelResponseModel>>, PackitResponse<List<TravelResponse>>>(response);
  }

  @override
  Future<PackitResponse<int>> inviteMember(int invitationCode) async {
    PackitResponseModel<int> response = await _api.inviteMember(invitationCode);

    return _mappr.convert<PackitResponseModel<int>, PackitResponse<int>>(response);
  }

  @override
  Future<PackitResponse<int>> newTravel(PackitNewTravelEntity newTravelEntity) async {
    PackitResponseModel<int> response = await _api.newTravel(newTravelEntity);

    return _mappr.convert<PackitResponseModel<int>, PackitResponse<int>>(response);
  }
}
