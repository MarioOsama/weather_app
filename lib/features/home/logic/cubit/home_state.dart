import 'package:weather_app/features/home/data/models/current_weather_response_body.dart';

abstract class HomeState {
  final bool isHomeSheetExpanded;
  final bool isHourlyForecast;

  const HomeState(
      {required this.isHourlyForecast, required this.isHomeSheetExpanded});

  // final bool? isHourlyForecast;
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
  const HomeLoaded(this.currentWeather,
      {super.isHomeSheetExpanded = false, super.isHourlyForecast = true});
}

class HomeError extends HomeState {
  const HomeError(this.message,
      {super.isHomeSheetExpanded = false, super.isHourlyForecast = true});

  final String message;
}

class HomeNoInternet extends HomeState {
  const HomeNoInternet(
      {super.isHomeSheetExpanded = false, super.isHourlyForecast = true});
}

class HomeNoLocation extends HomeState {
  const HomeNoLocation(
      {super.isHomeSheetExpanded = false, super.isHourlyForecast = true});
}
