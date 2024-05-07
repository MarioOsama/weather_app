import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/helpers/spacing.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';
import 'package:weather_app/features/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:weather_app/features/on_boarding/cubit/on_boarding_state.dart';

class OnBoardingLowerPartTexts extends StatelessWidget {
  const OnBoardingLowerPartTexts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        final cubit = context.read<OnBoardingCubit>();
        final List onBoardingPages = cubit.onBoardingPages;
        final int currentIndex = cubit.state.currentPageIndex;
        return Column(
          children: [
            Text(
              onBoardingPages[currentIndex].title,
              style: AppTextStyles.font32PrimarySemiBold,
              textAlign: TextAlign.center,
            ),
            verticalSpace(21),
            Text(
              onBoardingPages[currentIndex].description,
              style: AppTextStyles.font18GreyRegular,
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
