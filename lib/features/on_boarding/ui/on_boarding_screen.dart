import 'package:flutter/material.dart';
import 'package:weather_app/features/on_boarding/ui/on_boarding_completeness_bloc_listener.dart';
import 'package:weather_app/features/on_boarding/ui/on_boarding_lower_part.dart';
import 'package:weather_app/features/on_boarding/ui/widgets/on_boarding_clipper.dart';
import 'package:weather_app/features/on_boarding/ui/widgets/on_boarding_upper_part.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: ClipPath(
              clipper: ArcClipper(),
              child: const OnBoardingUpperPart(),
            ),
          ),
          const Flexible(
            flex: 2,
            child: OnBoardingLowerPart(),
          ),
          const OnBoardingCompletenessBlocListener(),
        ],
      ),
    );
  }
}
