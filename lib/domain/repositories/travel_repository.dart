import '../entities/packit_new_travel_entity.dart';
import '../entities/packit_response.dart';
import '../entities/travel_response.dart';

abstract class TravelRepository {
  Future<PackitResponse<List<TravelResponse>>> getPastTravels();
  Future<PackitResponse<List<TravelResponse>>> getUpcomingTravels();
  Future<PackitResponse<int>> newTravel(PackitNewTravelEntity newTravelEntity);
}
