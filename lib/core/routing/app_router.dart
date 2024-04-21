import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/di/dependency_injection.dart';
import 'package:weather_app/core/routing/app_routes.dart';
import 'package:weather_app/features/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:weather_app/features/on_boarding/ui/on_boarding_screen.dart';

class AppRouter {
  final bool isFirstTime;
  const AppRouter({required this.isFirstTime});

  Route onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<OnBoardingCubit>(
            create: (context) => getIt<OnBoardingCubit>(),
            child: const OnBoardingScreen(),
          ),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                    body: Center(
                  child: Text('Home Screen'),
                )));
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                    body: Center(
                  child: Text('Non defined'),
                )));
    }
  }
}