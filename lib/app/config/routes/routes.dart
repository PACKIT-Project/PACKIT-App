import 'package:get/route_manager.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/presentation/authentication/controller/auth_binding.dart';
import 'package:packit/presentation/authentication/views/login_page.dart';
import 'package:packit/presentation/authentication/views/onboarding_page.dart';

class Routes {
  static List<GetPage> routes = [
    // Authentication
    GetPage(
      name: RoutePath.login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: RoutePath.onboarding,
      page: () => const OnboardingPage(),
      binding: AuthBinding(),
    ),
  ];
}
