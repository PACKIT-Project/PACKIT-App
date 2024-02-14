import '../entities/check_list_response.dart';
import '../entities/invitation_response.dart';
import '../entities/packit_empty_response.dart';
import '../entities/packit_new_travel_entity.dart';
import '../entities/packit_response.dart';
import '../entities/travel_member_response.dart';
import '../entities/travel_response.dart';

abstract class TravelRepository {
  Future<PackitEmptyResponse> deleteTravel(int travelId);
  Future<PackitResponse<InvitationResponse>> getInvitationInfo(int travelId);
  Future<PackitResponse<CheckListResponse>> getMemberCheckList(int travelId, int memberId);
  Future<PackitResponse<CheckListResponse>> getMyCheckList(int travelId);
  Future<PackitResponse<List<TravelResponse>>> getPastTravels();
  Future<PackitResponse<TravelResponse>> getTravel(int travelId);
  Future<PackitResponse<List<TravelMemberResponse>>> getTravelMembers(int travelId);
  Future<PackitResponse<List<TravelResponse>>> getUpcomingTravels();
  Future<PackitResponse<int>> inviteMember(int invitationCode);
  Future<PackitResponse<int>> newTravel(PackitNewTravelEntity newTravelEntity);
}
