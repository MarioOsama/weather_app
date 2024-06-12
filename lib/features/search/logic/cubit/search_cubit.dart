import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/networking/api_constant.dart';
import 'package:weather_app/core/networking/failure.dart';
import 'package:weather_app/core/networking/response_code.dart';
import 'package:weather_app/core/networking/response_message.dart';
import 'package:weather_app/features/home/data/models/current_weather_response_body.dart';
import 'package:weather_app/features/search/data/models/city_weather_request_body.dart';
import 'package:weather_app/features/search/data/repos/search_repo.dart';
import 'package:weather_app/features/search/logic/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _searchRepo;
  SearchCubit(this._searchRepo) : super(const SearchInitial());

  TextEditingController searchController = TextEditingController();

  void setupSearch(CurrentWeatherResponseBody currentWeather) {
    emit(SearchInitial(currentWeather: currentWeather));
  }

  void validateThenSearch(String language) {
    if (searchController.text.trim().isEmpty ||
        searchController.text.trim().length < 3) {
      emit(SearchError(
          Failure(ResponseCode.INVALID_CITY_NAME,
              ResponseMessage.INVALID_CITY_NAME.tr()),
          currentWeather: state.currentWeather!));
    } else {
      emit(SearchLoading(currentWeather: state.currentWeather!));
      final CityWeatherRequestBody cityWeatherRequestBody =
          CityWeatherRequestBody(
        cityName: searchController.text.trim(),
        units: 'metric',
        apiKey: ApiConstants.apiKey,
        lang: language,
      );

      searchCityWeather(cityWeatherRequestBody);
    }
  }

  Future<void> searchCityWeather(
      CityWeatherRequestBody cityWeatherRequestBody) async {
    final result = await _searchRepo.getCityWeatherData(cityWeatherRequestBody);
    result.fold((failure) {
      emit(SearchError(failure, currentWeather: state.currentWeather!));
    }, (cityWeather) {
      emit(SearchLoaded(
          searchResult: cityWeather, currentWeather: state.currentWeather!));
    });
  }
}
