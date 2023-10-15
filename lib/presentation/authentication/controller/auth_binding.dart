import 'package:get/get.dart';
import 'package:packit/presentation/authentication/controller/onboarding_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingController());
  }
}
