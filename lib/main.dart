import 'package:flutter/material.dart';
import 'package:weather_app/core/di/dependency_injection.dart';
import 'package:weather_app/core/prefs/shared_preferences.dart';
import 'package:weather_app/core/routing/app_router.dart';
import 'package:weather_app/weather_forcast_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setupGetIt();

  bool isFirstTime = await userStatus;
  AppRouter appRouter = AppRouter(isFirstTime: isFirstTime);
  runApp(
    WeatherForcastApp(
      appRouter: appRouter,
    ),
  );
}
