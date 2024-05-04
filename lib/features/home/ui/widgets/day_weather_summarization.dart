import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/helpers/spacing.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';
import 'package:weather_app/features/home/logic/cubit/home_cubit.dart';
import 'package:weather_app/features/home/logic/cubit/home_state.dart';
import 'package:weather_app/features/home/ui/widgets/high_low_degrees.dart';

import 'current_city_degree_weather_condition.dart';

class DayWeatherSummarization extends StatelessWidget {
  const DayWeatherSummarization({
    super.key,
    required this.isNight,
  });

  final bool isNight;

  @override
  Widget build(BuildContext context) {
    final Color? color = isNight ? Colors.white : null;
    final bool isHidden = context.read<HomeCubit>().state is HomeHidden;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation) {
        return SizeTransition(
          axisAlignment: 0.75,
          sizeFactor: animation,
          child: child,
        );
      },
      child: isHidden
          ? _buildShortSummarization()
          : _buildFullSummarization(color),
    );
  }

  Column _buildFullSummarization(Color? color) {
    return Column(
      children: <Widget>[
        verticalSpace(100),
        CurrentCityDegreeWeatherCondition(
          color: color,
        ),
        HighLowDegrees(
          color: color,
        )
      ],
    );
  }

  Center _buildShortSummarization() {
    return Center(
      child: Column(
        children: [
          verticalSpace(50),
          const Text(
            'Montreal',
            style: AppTextStyles.font34WhiteRegular,
          ),
          Text(
            '19° | Cloudy',
            style: AppTextStyles.font20WhiteSemiBold.copyWith(
              color: AppColors.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
