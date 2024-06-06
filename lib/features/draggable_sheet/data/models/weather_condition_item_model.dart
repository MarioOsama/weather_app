import 'package:weather_app/core/theming/app_assets.dart';

class WeatherConditionItemModel {
  final DateTime dateTime;
  final String icon;
  final double temp;

  const WeatherConditionItemModel({
    required this.dateTime,
    required this.icon,
    required this.temp,
  });

  static setWeatherIcon(String weather) {
    switch (weather) {
      case 'Clear':
        return Assets.imagesPngsSun;
      case 'Clouds':
        return Assets.imagesPngsClouds;
      case 'Rain':
        return Assets.imagesPngsRainyCloud;
      case 'Snow':
        return Assets.imagesPngsSnow;
      case 'Thunderstorm':
        return Assets.imagesPngsThunder;
      default:
        return Assets.imagesPngsSun;
    }
  }
}
