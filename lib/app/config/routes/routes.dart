import 'package:get/route_manager.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/presentation/authentication/controller/login_binding.dart';
import 'package:packit/presentation/authentication/views/login_page.dart';
import 'package:packit/presentation/home/views/travel_remind_page.dart';
import 'package:packit/presentation/main/controller/main_binding.dart';
import 'package:packit/presentation/main/views/main_page.dart';
import 'package:packit/presentation/notification/controller/notification_binding.dart';
import 'package:packit/presentation/notification/views/notification_page.dart';
import 'package:packit/presentation/onboarding/controller/onboarding_binding.dart';
import 'package:packit/presentation/onboarding/views/onboarding_page.dart';
import 'package:packit/presentation/onboarding/views/profile_page.dart';
import 'package:packit/presentation/onboarding/views/term_page.dart';
import 'package:packit/presentation/new_tour/controller/new_tour_binding.dart';
import 'package:packit/presentation/new_tour/views/check_tour_information_page.dart';
import 'package:packit/presentation/new_tour/views/select_date_page.dart';
import 'package:packit/presentation/new_tour/views/select_region_page.dart';
import 'package:packit/presentation/new_tour/views/select_title_page.dart';
import 'package:packit/presentation/profile/views/invite_travel_page.dart';
import 'package:packit/presentation/profile/views/notification_setting_page.dart';
import 'package:packit/presentation/profile/views/setting_page.dart';

class Routes {
  static List<GetPage> routes = [
    // Authentication
    GetPage(
      name: RoutePath.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: RoutePath.travelRemind,
      page: () => const TravelRemindPage(),
    ),

    // Main
    GetPage(
      name: RoutePath.main,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),

    // Notification
    GetPage(
      name: RoutePath.notification,
      page: () => const NotificationPage(),
      binding: NotificationBinding(),
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
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: RoutePath.setProfile,
      page: () => const SetProfilePage(),
    ),

    // Add New Tour
    GetPage(
      name: RoutePath.selectRegion,
      page: () => const SelectRegionPage(),
      binding: NewTourBinding(),
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

    // Profile
    GetPage(
      name: RoutePath.inviteTravel,
      page: () => InviteTravelPage(),
    ),
    GetPage(
      name: RoutePath.notificationSetting,
      page: () => const NotificationSettingPage(),
    ),
    GetPage(
      name: RoutePath.setting,
      page: () => const SettingPage(),
    ),
  ];
}
