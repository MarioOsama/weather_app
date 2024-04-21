import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/features/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:weather_app/features/on_boarding/cubit/on_boarding_state.dart';
import 'package:weather_app/features/on_boarding/data/models/on_boarding_page_model.dart';
import 'package:weather_app/features/on_boarding/ui/widgets/indicators_group_row.dart';
import 'package:weather_app/features/on_boarding/ui/widgets/on_boarding_upper_part_image.dart';

class OnBoardingUpperPart extends StatelessWidget {
  const OnBoardingUpperPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        final cubit = context.read<OnBoardingCubit>();
        final List onBoardingPages = cubit.onBoardingPages;
        final int currentIndex = state.currentPageIndex;
        final OnBoardingPageModel currentPage = onBoardingPages[currentIndex];
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primaryGradientColorOne,
                AppColors.primaryGradientColorTwo
              ],
            ),
          ),
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: OnBoardingUpperPartImage(image: currentPage.imagePath),
              ),
              Positioned(
                top: 355,
                left: 0,
                right: 0,
                child: IndicatorsGroupRow(
                  activeIndex: currentIndex,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
