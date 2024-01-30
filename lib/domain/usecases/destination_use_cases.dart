import 'package:get/get.dart';

import '../entities/destination_response.dart';
import '../entities/packit_response.dart';
import '../repositories/destination_repository.dart';

class DestinationUseCases {
  final DestinationRepository _repository = Get.find<DestinationRepository>();

  SearchDestinationUseCase get searchDestination => SearchDestinationUseCase(_repository);
}

class SearchDestinationUseCase {
  final DestinationRepository _repository;
  SearchDestinationUseCase(this._repository);

  Future<PackitResponse<List<DestinationResponse>>> execute(String keyword) async {
    return await _repository.searchDestination(keyword);
  }
}
