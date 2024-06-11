import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_assets.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({
    super.key,
    required this.temp,
    required this.weatherDescription,
  });

  final String temp;
  final String weatherDescription;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$temp°',
          style: AppTextStyles.font64WhiteThin,
        ),
        const Spacer(),
        Image.asset(
          setWeatherIcon(weatherDescription),
          width: 130,
        ),
      ],
    );
  }

  static setWeatherIcon(String weatherDescription) {
    final String weather = weatherDescription.toLowerCase();
    if (weather.contains('clear')) {
      return Assets.imagesPngsSun;
    } else if (weather.contains('clouds')) {
      return Assets.imagesPngsClouds;
    } else if (weather.contains('rain')) {
      return Assets.imagesPngsRainyCloud;
    } else if (weather.contains('snow')) {
      return Assets.imagesPngsSnow;
    } else if (weather.contains('thunderstorm')) {
      return Assets.imagesPngsThunder;
    } else {
      return Assets.imagesPngsSun;
    }
  }
}
