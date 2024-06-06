import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/networking/api_services.dart';
import 'package:weather_app/features/home/data/models/forecast_weather_response_body.dart';
import 'package:weather_app/features/home/data/models/weather_request_body.dart';
import 'package:weather_app/features/home/data/models/current_weather_response_body.dart';

class HomeRepo {
  final ApiServices _apiServices;

  const HomeRepo(this._apiServices);

  Future<CurrentWeatherResponseBody> getWeatherData(
      WeatherRequestBody currentWeatherRequestBody) async {
    final CurrentWeatherResponseBody weatherData =
        await _apiServices.getCurrentWeatherData(currentWeatherRequestBody);
    return weatherData;
  }

  Future<ForecastWeatherResponseBody> getForecastData(
      WeatherRequestBody currentWeatherRequestBody) async {
    final ForecastWeatherResponseBody forecastData =
        await _apiServices.getForecastedWeatherData(currentWeatherRequestBody);
    return forecastData;
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When permissions are granted, get the position.
    return await Geolocator.getCurrentPosition();
  }
}
