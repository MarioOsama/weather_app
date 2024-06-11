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
