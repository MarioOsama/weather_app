import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/helpers/extensions.dart';
import 'package:weather_app/core/routing/app_routes.dart';
import 'package:weather_app/features/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:weather_app/features/on_boarding/cubit/on_boarding_state.dart';

class OnBoardingCompletenessBlocListener extends StatelessWidget {
  const OnBoardingCompletenessBlocListener({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnBoardingCubit, OnBoardingState>(
      listener: (context, state) {
        if (state is OnBoardingCompleted) {
          context.pushReplacementNamed(AppRoutes.home);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
