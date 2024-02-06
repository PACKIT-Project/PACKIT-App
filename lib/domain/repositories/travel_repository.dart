import '../entities/packit_new_travel_entity.dart';
import '../entities/packit_response.dart';

abstract class TravelRepository {
  Future<PackitResponse<int>> newTravel(PackitNewTravelEntity newTravelEntity);
}
