import '../entities/packit_empty_response.dart';
import '../entities/packit_new_travel_entity.dart';
import '../entities/packit_response.dart';
import '../entities/travel_response.dart';

abstract class TravelRepository {
  Future<PackitEmptyResponse> deleteTravel(int travelId);
  Future<PackitResponse<List<TravelResponse>>> getPastTravels();
  Future<PackitResponse<List<TravelResponse>>> getUpcomingTravels();
  Future<PackitResponse<int>> newTravel(PackitNewTravelEntity newTravelEntity);
}
