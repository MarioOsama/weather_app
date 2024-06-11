import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/networking/api_constant.dart';
import 'package:weather_app/features/home/data/models/forecast_weather_response_body.dart';
import 'package:weather_app/features/home/data/models/weather_request_body.dart';
import 'package:weather_app/features/home/data/models/current_weather_response_body.dart';
import 'package:weather_app/features/home/data/repos/home_repo.dart';
import 'package:weather_app/features/home/logic/cubit/home_state.dart';
import 'package:weather_app/features/search/data/models/city_weather_request_body.dart';

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
      final ForecastWeatherResponseBody weeklyWeather =
          (state as HomeLoaded).weeklyForecast;
      final ForecastWeatherResponseBody forecastedWeather =
          (state as HomeLoaded).forecastWeather;
      emit(HomeLoaded(weather, weeklyWeather, forecastedWeather,
          isHomeSheetExpanded: true));
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
      final ForecastWeatherResponseBody weeklyWeather =
          (state as HomeLoaded).weeklyForecast;

      final ForecastWeatherResponseBody forecastedWeather =
          (state as HomeLoaded).forecastWeather;
      emit(HomeLoaded(weather, weeklyWeather, forecastedWeather,
          isHomeSheetExpanded: false));
    } else if (state is HomeError) {
      final String error = (state as HomeError).message;
      emit(HomeError(error, isHomeSheetExpanded: false));
    }
  }

  void toggleForecastType(String forecastType) {
    if (forecastType == 'Hourly') {
      changeToHourlyForecast();
    } else {
      changeToWeeklyForecast();
    }
  }

  void loadWeatherData(String forecastType) async {
    final bool isHourlyForecast = _getForecastType(forecastType);
    // emit(HomeLoading(isHourlyForecast: isHourlyForecast));
    emit(const HomeLoading());
    Position currentLocation = await _homeRepo.getCurrentLocation();
    final currentPosLon = currentLocation.longitude;
    final currentPosLat = currentLocation.latitude;

    final WeatherRequestBody request = WeatherRequestBody(
      lon: currentPosLon,
      lat: currentPosLat,
      apiKey: ApiConstants.apiKey,
      units: 'metric',
    );

    final CurrentWeatherResponseBody weatherData =
        await _homeRepo.getWeatherData(
      request,
    );

    final ForecastWeatherResponseBody forecastedWeatherData =
        await _homeRepo.getForecastData(
      request,
    );

    final ForecastWeatherResponseBody weeklyResponseBody =
        ForecastWeatherResponseBody(
            weatherList: getWeeklyForecast(forecastedWeatherData));

    emit(HomeLoaded(
      isHourlyForecast: isHourlyForecast,
      weatherData,
      weeklyResponseBody,
      forecastedWeatherData,
    ));
  }

  void loadWeatherDataByCityName(String cityName) async {
    emit(const HomeLoading());
    final CityWeatherRequestBody request = CityWeatherRequestBody(
      cityName: cityName,
      apiKey: ApiConstants.apiKey,
      units: 'metric',
    );

    final CurrentWeatherResponseBody weatherData =
        await _homeRepo.getCurrentWeatherDataByCityName(
      request,
    );

    final ForecastWeatherResponseBody forecastedWeatherData =
        await _homeRepo.getForecastDataByCityName(
      request,
    );

    final ForecastWeatherResponseBody weeklyResponseBody =
        ForecastWeatherResponseBody(
            weatherList: getWeeklyForecast(forecastedWeatherData));

    emit(HomeLoaded(
      isHourlyForecast: true,
      weatherData,
      weeklyResponseBody,
      forecastedWeatherData,
    ));
  }

  void changeToWeeklyForecast() {
    emit((state as HomeLoaded).copyWith(isHourlyForecast: false));
  }

  void changeToHourlyForecast() {
    emit((state as HomeLoaded).copyWith(isHourlyForecast: true));
  }

  bool _getForecastType(String forecastType) {
    if (forecastType == 'Weekly') {
      return false;
    }
    return true;
  }

  List<Map<String, List>> getWeeklyForecast(
      ForecastWeatherResponseBody forecastWeather) {
    final List<Map> weatherList = forecastWeather.weatherList;
    final List<Map<String, List>> weeklyForecast = [];

    for (var element in weatherList) {
      final elementDate = element.keys.first.toString().split(' ')[0];
      // To avoid adding today's date to the weekly forecast
      if (elementDate == DateTime.now().toString().split(' ')[0]) {
        continue;
      }
      if (weeklyForecast.isEmpty) {
        weeklyForecast.add({
          elementDate: [element.values.first['temp']]
        });
      } else {
        if (weeklyForecast.last.keys.first == elementDate) {
          weeklyForecast.last[elementDate]!.add(element.values.first['temp']);
        } else {
          // Sort the temp list of before date before adding new date
          weeklyForecast.last[weeklyForecast.last.keys.first]!.sort();
          // Add new date with temp list
          weeklyForecast.add({
            elementDate: [element.values.first['temp']]
          });
        }
      }
    }

    return weeklyForecast;
  }
}
