import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'package:packit/domain/entities/packit_new_travel_entity.dart';

import '../../models/check_list_response_model.dart';
import '../../models/invitation_response_model.dart';
import '../../models/packit_empty_response_model.dart';
import '../../models/packit_response_model.dart';
import '../../models/travel_member_response_model.dart';
import '../../models/travel_response_model.dart';

part 'travel_api.g.dart';

@RestApi()
abstract class TravelAPI {
  factory TravelAPI(Dio dioBuilder) = _TravelAPI;

  @DELETE('/travels/{travelId}')
  Future<PackitEmptyResponseModel> deleteTravel(@Path('travelId') int travelId);

  @GET('/travels/invitations/{travelId}')
  Future<PackitResponseModel<InvitationResponseModel>> getInvitationInfo(@Path('travelId') int travelId);

  @GET('/travels/list/{travelId}/{memberId}')
  Future<PackitResponseModel<CheckListResponseModel>> getMemberCheckList(@Path('travelId') int travelId, @Path('memberId') int memberId);

  @GET('/travels/myList/{travelId}')
  Future<PackitResponseModel<CheckListResponseModel>> getMyCheckList(@Path('travelId') int travelId);

  @GET('/travels/past')
  Future<PackitResponseModel<List<TravelResponseModel>>> getPastTravels();

  @GET('/travels/{travelId}')
  Future<PackitResponseModel<TravelResponseModel>> getTravel(@Path('travelId') int travelId);

  @GET('/travels/members/{travelId}')
  Future<PackitResponseModel<List<TravelMemberResponseModel>>> getTravelMembers(@Path('travelId') int travelId);

  @GET('/travels/upcoming')
  Future<PackitResponseModel<List<TravelResponseModel>>> getUpcomingTravels();

  @POST('/travels/invitations')
  Future<PackitResponseModel<int>> inviteMember(@Query('invitationCode') int invitationCode);

  @POST('/travels/new')
  Future<PackitResponseModel<int>> newTravel(@Body() PackitNewTravelEntity newTravelEntity);
}
