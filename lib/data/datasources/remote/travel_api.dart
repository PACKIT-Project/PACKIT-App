import 'package:dio/dio.dart';
import 'package:packit/domain/entities/packit_new_travel_entity.dart';
import 'package:retrofit/http.dart';

import '../../models/invitation_response_model.dart';
import '../../models/packit_empty_response_model.dart';
import '../../models/packit_response_model.dart';
import '../../models/travel_response_model.dart';

part 'travel_api.g.dart';

@RestApi()
abstract class TravelAPI {
  factory TravelAPI(Dio dioBuilder) = _TravelAPI;

  @DELETE('/travels/{travelId}')
  Future<PackitEmptyResponseModel> deleteTravel(@Path('travelId') int travelId);

  @GET('/travels/invitations/{travelId}')
  Future<PackitResponseModel<InvitationResponseModel>> getInvitationInfo(@Path('travelId') int travelId);

  @GET('/travels/past')
  Future<PackitResponseModel<List<TravelResponseModel>>> getPastTravels();

  @GET('/travels/upcoming')
  Future<PackitResponseModel<List<TravelResponseModel>>> getUpcomingTravels();

  @POST('/travels/new')
  Future<PackitResponseModel<int>> newTravel(@Body() PackitNewTravelEntity newTravelEntity);
}
