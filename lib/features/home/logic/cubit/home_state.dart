import 'package:weather_app/core/networking/failure.dart';
import 'package:weather_app/features/home/data/models/current_weather_response_body.dart';
import 'package:weather_app/features/home/data/models/forecast_weather_response_body.dart';

abstract class HomeState {
  final bool isHomeSheetExpanded;
  final bool isHourlyForecast;

  const HomeState(
      {required this.isHourlyForecast, required this.isHomeSheetExpanded});
}

class HomeInitial extends HomeState {
  const HomeInitial(
      {super.isHomeSheetExpanded = false, super.isHourlyForecast = true});
}

class HomeLoading extends HomeState {
  const HomeLoading(
      {super.isHomeSheetExpanded = false, super.isHourlyForecast = true});
}

class HomeLoaded extends HomeState {
  final CurrentWeatherResponseBody currentWeather;
  final ForecastWeatherResponseBody weeklyForecast;
  final ForecastWeatherResponseBody forecastWeather;
  const HomeLoaded(
      this.currentWeather, this.weeklyForecast, this.forecastWeather,
      {super.isHomeSheetExpanded = false, super.isHourlyForecast = true});

  HomeLoaded copyWith({
    CurrentWeatherResponseBody? currentWeather,
    ForecastWeatherResponseBody? weeklyForecast,
    ForecastWeatherResponseBody? forecastWeather,
    bool? isHomeSheetExpanded,
    bool? isHourlyForecast,
  }) {
    return HomeLoaded(
      currentWeather ?? this.currentWeather,
      weeklyForecast ?? this.weeklyForecast,
      forecastWeather ?? this.forecastWeather,
      isHomeSheetExpanded: isHomeSheetExpanded ?? this.isHomeSheetExpanded,
      isHourlyForecast: isHourlyForecast ?? this.isHourlyForecast,
    );
  }
}

class HomeError extends HomeState {
  const HomeError(this.failure,
      {super.isHomeSheetExpanded = false, super.isHourlyForecast = true});

  final Failure failure;
}

class HomeNoInternet extends HomeState {
  const HomeNoInternet(
      {super.isHomeSheetExpanded = false, super.isHourlyForecast = true});
}

class HomeNoLocation extends HomeState {
  const HomeNoLocation(this.message,
      {super.isHomeSheetExpanded = false, super.isHourlyForecast = true});

  final String message;
}
