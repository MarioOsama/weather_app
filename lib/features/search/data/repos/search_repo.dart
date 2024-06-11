import 'package:either_dart/either.dart';
import 'package:weather_app/core/networking/api_services.dart';
import 'package:weather_app/core/networking/error_handler.dart';
import 'package:weather_app/core/networking/failure.dart';
import 'package:weather_app/features/search/data/models/city_weather_request_body.dart';
import 'package:weather_app/features/search/data/models/city_weather_response_body.dart';

class SearchRepo {
  final ApiServices _apiServices;

  const SearchRepo(this._apiServices);

  Future<Either<Failure, CityWeatherResponseBody>> getCityWeatherData(
      CityWeatherRequestBody cityWeatherRequestBody) async {
    try {
      return Right(
          await _apiServices.getWeatherDataByCityName(cityWeatherRequestBody));
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
