import 'package:flutter/material.dart';
import 'package:weather_app/core/helpers/spacing.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';
import 'package:weather_app/features/home/data/models/current_weather_response_body.dart';

class ShortWeatherSummarization extends StatelessWidget {
  const ShortWeatherSummarization({
    super.key,
    required this.weather,
  });

  final CurrentWeatherResponseBody weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(50),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 25.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              weather.cityName,
              style: AppTextStyles.font20WhiteSemiBold,
            ),
          ),
        ),
        Text(
          '${weather.temp.round()}° | ${weather.weatherDescription}',
          style: AppTextStyles.font20WhiteSemiBold.copyWith(
            color: AppColors.greyColor,
          ),
        ),
      ],
    );
  }
}
