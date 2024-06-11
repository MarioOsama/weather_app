import 'package:weather_app/core/networking/failure.dart';
import 'package:weather_app/features/home/data/models/current_weather_response_body.dart';
import 'package:weather_app/features/search/data/models/city_weather_response_body.dart';

abstract class SearchState {
  const SearchState({this.currentWeather, this.searchResult});

  final CurrentWeatherResponseBody? currentWeather;
  final CityWeatherResponseBody? searchResult;
}

class SearchInitial extends SearchState {
  const SearchInitial({super.currentWeather, super.searchResult});
}

class SearchLoading extends SearchState {
  const SearchLoading({super.currentWeather, super.searchResult});
}

class SearchLoaded extends SearchState {
  const SearchLoaded({super.currentWeather, super.searchResult});
}

class SearchError extends SearchState {
  const SearchError(this.failure, {super.currentWeather, super.searchResult});

  final Failure failure;
}
