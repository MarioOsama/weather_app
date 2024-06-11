import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_app/core/networking/api_constant.dart';
import 'package:weather_app/features/search/data/models/city_weather_request_body.dart';
import 'package:weather_app/features/home/data/models/weather_request_body.dart';
import 'package:weather_app/features/home/data/models/current_weather_response_body.dart';
import 'package:weather_app/features/home/data/models/forecast_weather_response_body.dart';
import 'package:weather_app/features/search/data/models/city_weather_response_body.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @GET(ApiConstants.currentWeather)
  Future<CurrentWeatherResponseBody> getCurrentWeatherData(
    @Queries() WeatherRequestBody currentWeatherRequestBody,
  );

  @GET(ApiConstants.forecastedWeather)
  Future<ForecastWeatherResponseBody> getForecastedWeatherData(
    @Queries() WeatherRequestBody currentWeatherRequestBody,
  );

  @GET(ApiConstants.currentWeather)
  Future<CityWeatherResponseBody> getWeatherDataByCityName(
    @Queries() CityWeatherRequestBody cityWeatherRequestBody,
  );

  @GET(ApiConstants.currentWeather)
  Future<CurrentWeatherResponseBody> getCurrentWeatherDataByCityName(
    @Queries() CityWeatherRequestBody cityWeatherRequestBody,
  );

  @GET(ApiConstants.forecastedWeather)
  Future<ForecastWeatherResponseBody> getForecastedWeatherDataByCityName(
    @Queries() CityWeatherRequestBody cityWeatherRequestBody,
  );
}
