import 'package:dio/dio.dart';
import 'package:packit/data/models/destination_response_model.dart';
import 'package:retrofit/http.dart';

import '../../models/packit_response_model.dart';

part 'destination_api.g.dart';

@RestApi()
abstract class DestinationAPI {
  factory DestinationAPI(Dio dioBuilder) = _DestinationAPI;

  @GET('/destination/search')
  Future<PackitResponseModel<List<DestinationResponseModel>>> searchDestination(@Query('keyword') String keyword);
}
