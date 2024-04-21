import 'package:flutter/material.dart';
import 'package:weather_app/core/routing/app_router.dart';
import 'package:weather_app/core/routing/app_routes.dart';

class WeatherForcastApp extends StatelessWidget {
  final AppRouter appRouter;
  const WeatherForcastApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Forcast App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute:
          appRouter.isFirstTime ? AppRoutes.onBoarding : AppRoutes.home,
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
