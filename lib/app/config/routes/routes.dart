import 'package:get/route_manager.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/presentation/authentication/views/login_page.dart';
import 'package:packit/presentation/onboarding/controller/onboarding_binding.dart';
import 'package:packit/presentation/onboarding/views/onboarding_page.dart';
import 'package:packit/presentation/onboarding/views/profile_page.dart';
import 'package:packit/presentation/onboarding/views/term_page.dart';
import 'package:packit/presentation/tour/controller/tour_binding.dart';
import 'package:packit/presentation/tour/views/check_tour_information_page.dart';
import 'package:packit/presentation/tour/views/select_date_page.dart';
import 'package:packit/presentation/tour/views/select_party_page.dart';
import 'package:packit/presentation/tour/views/select_region_page.dart';
import 'package:packit/presentation/tour/views/tour_invite_page.dart';

class Routes {
  static List<GetPage> routes = [
    // Authentication
    GetPage(
      name: RoutePath.login,
      page: () => const LoginPage(),
    ),

    // Onboarding
    GetPage(
      name: RoutePath.onboarding,
      page: () => const OnboardingPage(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: RoutePath.setProfile,
      page: () => const SetProfilePage(),
    ),
    GetPage(
      name: RoutePath.term,
      page: () => const TermPage(),
    ),

    // Add Tour
    GetPage(
      name: RoutePath.selectRegion,
      page: () => const SelectRegionPage(),
      binding: TourBinding(),
    ),
    GetPage(
      name: RoutePath.selectDate,
      page: () => const SelectDatePage(),
    ),
    GetPage(
      name: RoutePath.selectParty,
      page: () => const SelectPartyPage(),
    ),
    GetPage(
      name: RoutePath.checkTourInformation,
      page: () => CheckTourInformationPage(),
    ),
    GetPage(
      name: RoutePath.tourInvite,
      page: () => const TourInvitePage(),
    ),
  ];
}
