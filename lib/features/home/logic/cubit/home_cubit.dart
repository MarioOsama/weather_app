import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/networking/api_constant.dart';
import 'package:weather_app/features/home/data/models/current_weather_request_body.dart';
import 'package:weather_app/features/home/data/models/current_weather_response_body.dart';
import 'package:weather_app/features/home/data/repos/home_repo.dart';
import 'package:weather_app/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeInitial());

  void hideHome() {
    if (state is HomeInitial) {
      emit(const HomeInitial());
    } else if (state is HomeLoading) {
      emit(
          const HomeLoading(isHourlyForecast: true, isHomeSheetExpanded: true));
    } else if (state is HomeLoaded) {
      final CurrentWeatherResponseBody weather =
          (state as HomeLoaded).currentWeather;

      emit(HomeLoaded(weather, isHomeSheetExpanded: true));
    } else if (state is HomeError) {
      final String error = (state as HomeError).message;
      emit(HomeError(error, isHomeSheetExpanded: true));
    }
  }

  void displayHome() {
    if (state is HomeInitial) {
      emit(const HomeInitial(
          isHourlyForecast: false, isHomeSheetExpanded: false));
    } else if (state is HomeLoading) {
      emit(const HomeLoading(
          isHourlyForecast: false, isHomeSheetExpanded: false));
    } else if (state is HomeLoaded) {
      final CurrentWeatherResponseBody weather =
          (state as HomeLoaded).currentWeather;
      emit(HomeLoaded(weather, isHomeSheetExpanded: false));
    } else if (state is HomeError) {
      final String error = (state as HomeError).message;
      emit(HomeError(error, isHomeSheetExpanded: false));
    }
  }

  void toggleForecastType(String forecastType) {
    loadWeatherData(forecastType);
  }

  void loadWeatherData(String forecastType) async {
    final bool isHourlyForecast = _getForecastType(forecastType);
    emit(HomeLoading(isHourlyForecast: isHourlyForecast));
    Position currentLocation = await _homeRepo.getCurrentLocation();
    final currentPosLon = currentLocation.longitude;
    final currentPosLat = currentLocation.latitude;
    log('Current Location Longitude: $currentPosLon');
    log('Current Location latitude: $currentPosLat');
    CurrentWeatherResponseBody weatherData = await _homeRepo.getWeatherData(
      CurrentWeatherRequestBody(
        lon: currentPosLon,
        lat: currentPosLat,
        apiKey: ApiConstants.apiKey,
        units: 'metric',
      ),
    );
    emit(HomeLoaded(isHourlyForecast: isHourlyForecast, weatherData));
  }

  bool _getForecastType(String forecastType) {
    if (forecastType == 'Weekly') {
      return false;
    }
    return true;
  }
}
