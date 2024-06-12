import 'package:flutter/material.dart';
import 'package:weather_app/core/helpers/extensions.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';
import 'package:weather_app/features/home/data/models/current_weather_response_body.dart';

class FullWeatherSummarization extends StatelessWidget {
  const FullWeatherSummarization({
    super.key,
    required this.color,
    required this.weather,
  });

  final Color color;
  final CurrentWeatherResponseBody weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              weather.cityName,
              style: AppTextStyles.font34WhiteRegular.copyWith(
                color: color,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Text(
            '${weather.temp.round().toString()}°',
            style: AppTextStyles.font96WhiteThin.copyWith(
              color: color,
            ),
          ),
        ),
        Text(
          weather.weatherDescription.toTitleCase(),
          style: AppTextStyles.font24WhiteSemiBold.copyWith(
            color: AppColors.greyColor,
          ),
        ),
      ],
    );
  }
}
