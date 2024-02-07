import 'package:get/get.dart';

import 'package:packit/domain/entities/destination_response.dart';
import 'package:packit/domain/entities/packit_response.dart';
import 'package:packit/domain/repositories/destination_repository.dart';

import '../datasources/remote/destination_api.dart';
import '../models/destination_response_model.dart';
import '../models/packit_response_model.dart';
import 'mappers/destination_mappr.dart';

final DestinationMappr _mappr = DestinationMappr();

class DestinationRepositoryImpl extends DestinationRepository {
  final DestinationAPI _api = Get.find();

  @override
  Future<PackitResponse<List<DestinationResponse>>> searchDestination(String keyword) async {
    PackitResponseModel<List<DestinationResponseModel>> response = await _api.searchDestination(keyword);

    return _mappr.convert<PackitResponseModel<List<DestinationResponseModel>>, PackitResponse<List<DestinationResponse>>>(response);
  }
}
