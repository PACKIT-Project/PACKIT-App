import 'package:dio/dio.dart';
import 'package:packit/domain/entities/packit_new_travel_entity.dart';
import 'package:retrofit/http.dart';

import '../../models/packit_response_model.dart';

part 'travel_api.g.dart';

@RestApi()
abstract class TravelAPI {
  factory TravelAPI(Dio dioBuilder) = _TravelAPI;

  @POST('/travels/new')
  Future<PackitResponseModel<int>> searchDestination(@Body() PackitNewTravelEntity newTravelEntity);
}
