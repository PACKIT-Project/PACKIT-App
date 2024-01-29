import 'package:get/get.dart';
import 'package:packit/domain/entities/login_response.dart';
import 'package:packit/domain/entities/packit_member_entity.dart';
import 'package:packit/domain/entities/packit_response.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  // Member
  PackitMemberEntity? member;

  // HACK: This is a temporary solution to get the login response from the login page
  PackitResponse<LoginResponse>? loginResponse;
}
