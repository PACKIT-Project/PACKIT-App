import 'package:get/route_manager.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/presentation/authentication/views/login_page.dart';
import 'package:packit/presentation/onboarding/controller/onboarding_binding.dart';
import 'package:packit/presentation/onboarding/views/profile_page.dart';
import 'package:packit/presentation/tour/controller/tour_binding.dart';
import 'package:packit/presentation/tour/views/select_date_page.dart';

class Routes {
  static List<GetPage> routes = [
    // Authentication
    GetPage(
      name: RoutePath.login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: RoutePath.setProfile,
      page: () => const SetProfilePage(),
      binding: OnboardingBinding(),
    ),

    // Tour
    GetPage(
      name: RoutePath.selectDate,
      page: () => const SelectDatePage(),
      binding: TourBinding(),
    ),
  ];
}
