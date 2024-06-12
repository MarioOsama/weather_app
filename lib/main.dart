import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/di/dependency_injection.dart';
import 'package:weather_app/core/prefs/shared_preferences.dart';
import 'package:weather_app/core/routing/app_router.dart';
import 'package:weather_app/weather_forcast_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Localization
  await EasyLocalization.ensureInitialized();

  // Dependency Injection
  setupGetIt();

  bool isFirstTime = await isNewUser;
  AppRouter appRouter = AppRouter(isFirstTime: isFirstTime);
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: WeatherForcastApp(
        appRouter: appRouter,
      ),
    ),
  );
}
