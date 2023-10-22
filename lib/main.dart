import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:packit/app/config/app_binding.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/app/config/routes/routes.dart';

void main() async {
  // Locale
  await initializeDateFormatting();
  Intl.defaultLocale = 'ko_KR';

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
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          },
          initialBinding: AppBinding(),
          initialRoute: RoutePath.login,
          getPages: Routes.routes,
        );
      },
    );
  }
}
