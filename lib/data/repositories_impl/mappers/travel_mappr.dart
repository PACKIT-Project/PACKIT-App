import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';

import 'package:packit/domain/entities/check_list_response.dart';
import 'package:packit/domain/entities/invitation_response.dart';
import 'package:packit/domain/entities/packit_empty_response.dart';
import 'package:packit/domain/entities/packit_response.dart';
import 'package:packit/domain/entities/travel_member_response.dart';
import 'package:packit/domain/entities/travel_response.dart';

import '../../models/check_list_response_model.dart';
import '../../models/invitation_response_model.dart';
import '../../models/packit_empty_response_model.dart';
import '../../models/packit_response_model.dart';
import '../../models/travel_member_response_model.dart';
import '../../models/travel_response_model.dart';
import 'travel_mappr.auto_mappr.dart';

@AutoMappr([
  MapType<PackitEmptyResponseModel, PackitEmptyResponse>(),
  MapType<PackitResponseModel<int>, PackitResponse<int>>(),
  MapType<CategoryResponseModel, CategoryResponse>(),
  MapType<ClusterResponseModel, ClusterResponse>(),
  MapType<ItemResponseModel, ItemResponse>(),
  MapType<CheckListResponseModel, CheckListResponse>(),
  MapType<PackitResponseModel<CheckListResponseModel>, PackitResponse<CheckListResponse>>(),
  MapType<InvitationResponseModel, InvitationResponse>(),
  MapType<PackitResponseModel<InvitationResponseModel>, PackitResponse<InvitationResponse>>(),
  MapType<TravelMemberResponseModel, TravelMemberResponse>(),
  MapType<PackitResponseModel<List<TravelMemberResponseModel>>, PackitResponse<List<TravelMemberResponse>>>(),
  MapType<TravelResponseModel, TravelResponse>(),
  MapType<PackitResponseModel<List<TravelResponseModel>>, PackitResponse<List<TravelResponse>>>(),
])
class TravelMappr extends $TravelMappr {}
