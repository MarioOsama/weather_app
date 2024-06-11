import 'package:flutter/material.dart';
import 'package:weather_app/core/helpers/extensions.dart';
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
    final cityName = getCityName(weather);
    return Column(
      children: [
        verticalSpace(50),
        Text(
          cityName,
          style: AppTextStyles.font28WhiteRegular,
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

  String getCityName(CurrentWeatherResponseBody weather) {
    if (weather.cityName.contains(',') ||
        weather.cityName.split(' ').length > 3) {
      final cityName = weather.cityName.getFirst(' ', 3);
      return cityName;
    } else {
      return weather.cityName;
    }
  }
}
