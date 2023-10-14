import 'package:get/route_manager.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/presentation/authentication/views/login_page.dart';

class Routes {
  static List<GetPage> routes = [
    GetPage(
      name: RoutePath.login,
      page: () => const LoginPage(),
    ),
  ];
}
