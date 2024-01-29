import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:packit/app/config/app_binding.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/app/config/routes/routes.dart';

void main() async {
  // Ensure that the WidgetsBinding has been initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Locale
  await initializeDateFormatting();
  Intl.defaultLocale = 'ko_KR';

  // Load .env file
  await dotenv.load(fileName: ".env");

  // Initialize Kakao SDK
  KakaoSdk.init(nativeAppKey: dotenv.env['KAKAO_NATIVE_APP_KEY']!);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (_, child) {
        return GetMaterialApp(
          localizationsDelegates: const [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ko', 'KR'),
          ],
          locale: const Locale('ko', 'KR'),
          theme: ThemeData(
            fontFamily: 'SUIT',
            useMaterial3: true,
            appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
            scaffoldBackgroundColor: Colors.white,
          ),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!,
            );
          },
          defaultTransition: Transition.fadeIn,
          initialBinding: AppBinding(),
          initialRoute: RoutePath.onboarding,
          getPages: Routes.routes,
        );
      },
    );
  }
}
