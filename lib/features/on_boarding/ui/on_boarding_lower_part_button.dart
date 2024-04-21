import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/features/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:weather_app/features/on_boarding/cubit/on_boarding_state.dart';

class OnBoardingLowerPartButton extends StatelessWidget {
  const OnBoardingLowerPartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            final cubit = context.read<OnBoardingCubit>();
            cubit.pageChanged(cubit.state.currentPageIndex + 1);
          },
          child: Container(
            padding: const EdgeInsets.all(13.0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primaryGradientColorOne,
                    AppColors.primaryGradientColorTwo
                  ]),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_forward_outlined,
              color: AppColors.whiteColor,
              size: 32,
            ),
          ),
        );
      },
    );
  }
}
