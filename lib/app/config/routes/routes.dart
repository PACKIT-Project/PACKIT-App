import 'package:get/route_manager.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/presentation/authentication/controller/login_binding.dart';
import 'package:packit/presentation/authentication/views/login_page.dart';
import 'package:packit/presentation/main/controller/main_binding.dart';
import 'package:packit/presentation/main/views/main_page.dart';
import 'package:packit/presentation/onboarding/controller/onboarding_binding.dart';
import 'package:packit/presentation/onboarding/views/onboarding_page.dart';
import 'package:packit/presentation/onboarding/views/profile_page.dart';
import 'package:packit/presentation/onboarding/views/term_page.dart';
import 'package:packit/presentation/tour/controller/tour_binding.dart';
import 'package:packit/presentation/tour/views/check_tour_information_page.dart';
import 'package:packit/presentation/tour/views/select_date_page.dart';
import 'package:packit/presentation/tour/views/select_region_page.dart';
import 'package:packit/presentation/tour/views/select_title_page.dart';

class Routes {
  static List<GetPage> routes = [
    // Authentication
    GetPage(
      name: RoutePath.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),

    // Home
    GetPage(
      name: RoutePath.main,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),

    // Onboarding
    GetPage(
      name: RoutePath.onboarding,
      page: () => const OnboardingPage(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: RoutePath.term,
      page: () => const TermPage(),
    ),
    GetPage(
      name: RoutePath.setProfile,
      page: () => const SetProfilePage(),
    ),

    // Add Tour
    GetPage(
      name: RoutePath.selectRegion,
      page: () => const SelectRegionPage(),
      binding: TourBinding(),
    ),
    GetPage(
      name: RoutePath.selectTitle,
      page: () => const SelectTitlePage(),
    ),
    GetPage(
      name: RoutePath.selectDate,
      page: () => const SelectDatePage(),
    ),

    GetPage(
      name: RoutePath.checkTourInformation,
      page: () => CheckTourInformationPage(),
    ),
  ];
}
