import 'package:get/get.dart';

import '../entities/check_list_response.dart';
import '../entities/invitation_response.dart';
import '../entities/packit_empty_response.dart';
import '../entities/packit_new_travel_entity.dart';
import '../entities/packit_response.dart';
import '../entities/travel_member_response.dart';
import '../entities/travel_response.dart';
import '../repositories/travel_repository.dart';

class TravelUseCases {
  final TravelRepository _repository = Get.find<TravelRepository>();

  DeleteTravelUseCase get deleteTravelUseCase => DeleteTravelUseCase(_repository);
  GetInvitationInfoUseCase get getInvitationInfoUseCase => GetInvitationInfoUseCase(_repository);
  GetMemberCheckListUseCase get getMemberCheckListUseCase => GetMemberCheckListUseCase(_repository);
  GetMyCheckListUseCase get getMyCheckListUseCase => GetMyCheckListUseCase(_repository);
  GetPastTravelsUseCase get getPastTravelsUseCase => GetPastTravelsUseCase(_repository);
  GetTravelUseCase get getTravelUseCase => GetTravelUseCase(_repository);
  GetTravelMembersUseCase get getTravelMembersUseCase => GetTravelMembersUseCase(_repository);
  GetUpcomingTravelsUseCase get getUpcomingTravelsUseCase => GetUpcomingTravelsUseCase(_repository);
  InviteMemberUseCase get inviteMemberUseCase => InviteMemberUseCase(_repository);
  NewTravelUseCase get newTravelUseCase => NewTravelUseCase(_repository);
}

class DeleteTravelUseCase {
  final TravelRepository _repository;
  DeleteTravelUseCase(this._repository);

  Future<PackitEmptyResponse> execute(int travelId) async {
    return await _repository.deleteTravel(travelId);
  }
}

class GetInvitationInfoUseCase {
  final TravelRepository _repository;
  GetInvitationInfoUseCase(this._repository);

  Future<PackitResponse<InvitationResponse>> execute(int travelId) async {
    return await _repository.getInvitationInfo(travelId);
  }
}

class GetMemberCheckListUseCase {
  final TravelRepository _repository;
  GetMemberCheckListUseCase(this._repository);

  Future<PackitResponse<CheckListResponse>> execute(int travelId, int memberId) async {
    return await _repository.getMemberCheckList(travelId, memberId);
  }
}

class GetMyCheckListUseCase {
  final TravelRepository _repository;
  GetMyCheckListUseCase(this._repository);

  Future<PackitResponse<CheckListResponse>> execute(int travelId) async {
    return await _repository.getMyCheckList(travelId);
  }
}

class GetPastTravelsUseCase {
  final TravelRepository _repository;
  GetPastTravelsUseCase(this._repository);

  Future<PackitResponse<List<TravelResponse>>> execute() async {
    return await _repository.getPastTravels();
  }
}

class GetTravelUseCase {
  final TravelRepository _repository;
  GetTravelUseCase(this._repository);

  Future<PackitResponse<TravelResponse>> execute(int travelId) async {
    return await _repository.getTravel(travelId);
  }
}

class GetTravelMembersUseCase {
  final TravelRepository _repository;
  GetTravelMembersUseCase(this._repository);

  Future<PackitResponse<List<TravelMemberResponse>>> execute(int travelId) async {
    return await _repository.getTravelMembers(travelId);
  }
}

class GetUpcomingTravelsUseCase {
  final TravelRepository _repository;
  GetUpcomingTravelsUseCase(this._repository);

  Future<PackitResponse<List<TravelResponse>>> execute() async {
    return await _repository.getUpcomingTravels();
  }
}

class InviteMemberUseCase {
  final TravelRepository _repository;
  InviteMemberUseCase(this._repository);

  Future<PackitResponse<int>> execute(int invitationCode) async {
    return await _repository.inviteMember(invitationCode);
  }
}

class NewTravelUseCase {
  final TravelRepository _repository;
  NewTravelUseCase(this._repository);

  Future<PackitResponse<int>> execute(PackitNewTravelEntity newTravelEntity) async {
    return await _repository.newTravel(newTravelEntity);
  }
}
