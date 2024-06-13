import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_assets.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({
    super.key,
    required this.temp,
    required this.weatherMain,
  });

  final String temp;
  final String weatherMain;

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
          setWeatherIcon(weatherMain),
          width: 130,
        ),
      ],
    );
  }

  static setWeatherIcon(String weatherMain) {
    final String weather = weatherMain;
    if (weather.contains('Clear')) {
      return Assets.imagesPngsSun;
    } else if (weather.contains('Clouds')) {
      return Assets.imagesPngsClouds;
    } else if (weather.contains('Rain')) {
      return Assets.imagesPngsRainyCloud;
    } else if (weather.contains('Snow')) {
      return Assets.imagesPngsSnow;
    } else if (weather.contains('Thunderstorm')) {
      return Assets.imagesPngsThunder;
    } else {
      return Assets.imagesPngsSun;
    }
  }
}
