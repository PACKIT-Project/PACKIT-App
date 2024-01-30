import '../entities/destination_response.dart';
import '../entities/packit_response.dart';

abstract class DestinationRepository {
  Future<PackitResponse<List<DestinationResponse>>> searchDestination(String keyword);
}
