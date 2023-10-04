import 'package:get/route_manager.dart';
import 'package:packit/features/authentication/presentation/view/login_page.dart';

class AppRoute {
  static String login = "/login";

  static List<GetPage> routes = [
    GetPage(
      name: login,
      page: () => const LoginPage(),
    ),
  ];
}
