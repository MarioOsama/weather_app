import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';
import 'package:weather_app/features/home/data/models/current_weather_response_body.dart';
import 'package:weather_app/features/home/logic/cubit/home_cubit.dart';
import 'package:weather_app/features/home/logic/cubit/home_state.dart';
import 'package:weather_app/features/home/ui/widgets/full_weather_summarization.dart';
import 'package:weather_app/features/home/ui/widgets/short_weather_summarization.dart';

class DayWeatherSummarization extends StatelessWidget {
  const DayWeatherSummarization({
    super.key,
    required this.isNight,
  });

  final bool isNight;

  @override
  Widget build(BuildContext context) {
    final Color color =
        isNight ? Colors.white : AppColors.secondaryGradientColorTwo;
    final bool isHidden = context.read<HomeCubit>().state.isHomeSheetExpanded;
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeLoaded || current is HomeError,
      builder: (context, state) {
        if (state is HomeError) {
          log(state.failure.message);
          return Center(
            child: Text(
              state.failure.message,
              style: AppTextStyles.font16WhiteRegular,
            ),
          );
        }

        final CurrentWeatherResponseBody weather =
            (state as HomeLoaded).currentWeather;

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
              ? _buildShortSummarization(weather)
              : _buildFullSummarization(color, weather),
        );
      },
    );
  }

  Center _buildFullSummarization(
      Color color, CurrentWeatherResponseBody weather) {
    return Center(
      key: const ValueKey('full_summarization'),
      child: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: FullWeatherSummarization(
          color: color,
          weather: weather,
        ),
      ),
    );
  }

  Center _buildShortSummarization(CurrentWeatherResponseBody weather) {
    return Center(
      key: const ValueKey('short_summarization'),
      child: ShortWeatherSummarization(weather: weather),
    );
  }
}
