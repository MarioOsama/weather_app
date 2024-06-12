import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:either_dart/either.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/helpers/app_string.dart';
import 'package:weather_app/core/networking/api_services.dart';
import 'package:weather_app/core/networking/error_handler.dart';
import 'package:weather_app/core/networking/failure.dart';
import 'package:weather_app/features/home/data/models/forecast_weather_response_body.dart';
import 'package:weather_app/features/home/data/models/weather_request_body.dart';
import 'package:weather_app/features/home/data/models/current_weather_response_body.dart';
import 'package:weather_app/features/search/data/models/city_weather_request_body.dart';

class HomeRepo {
  final ApiServices _apiServices;

  const HomeRepo(this._apiServices);

  Future<Either<Failure, CurrentWeatherResponseBody>> getWeatherData(
      WeatherRequestBody currentWeatherRequestBody) async {
    try {
      return Right(
          await _apiServices.getCurrentWeatherData(currentWeatherRequestBody));
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, ForecastWeatherResponseBody>> getForecastData(
      WeatherRequestBody currentWeatherRequestBody) async {

    try{
      return Right(
        await _apiServices.getForecastedWeatherData(currentWeatherRequestBody)
      );
    }catch (e){
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<CurrentWeatherResponseBody> getCurrentWeatherDataByCityName(
      CityWeatherRequestBody cityWeatherRequestBody) async {
    return await _apiServices
        .getCurrentWeatherDataByCityName(cityWeatherRequestBody);
  }

  Future<ForecastWeatherResponseBody> getForecastDataByCityName(
      CityWeatherRequestBody cityWeatherRequestBody) async {
    return await _apiServices
        .getForecastedWeatherDataByCityName(cityWeatherRequestBody);
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error(AppStrings.locationPermissionDisabledError);
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(AppStrings.locationPermissionDeniedError);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(AppStrings.locationPermissionPermanentlyDeniedError);
    }

    // When permissions are granted, get the position.
    return await Geolocator.getCurrentPosition();
  }

  Future<bool> hasInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile);
  }
}
