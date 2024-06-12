import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/draggable_sheet/data/models/weather_condition_item_model.dart';
import 'package:weather_app/features/draggable_sheet/data/models/weekly_condition_item_model.dart';
import 'package:weather_app/features/draggable_sheet/logic/cubit/sheet_state.dart';

class SheetCubit extends Cubit<SheetState> {
  SheetCubit() : super(const SheetInitial());

  final sheetController = GlobalKey();
  DraggableScrollableController draggingController =
      DraggableScrollableController();

  void expandSheet() => emit(SheetExpanded(
        draggingController.size,
      ));

  void collapseSheet() => emit(SheetCollapsed(
        draggingController.size,
      ));

  List<Map<String, dynamic>> getTodayWeatherConditions(List weatherList) {
    final DateTime todayDate = DateTime.now();

    final List<Map<String, dynamic>> todayWeatherConditions =
        weatherList.where((e) {
      final elementStrDate = e.keys.first;
      final DateTime elementDate = DateTime.parse(elementStrDate);
      return elementDate.day == todayDate.day;
    }).toList() as List<Map<String, dynamic>>;

    return todayWeatherConditions;
  }

  List<WeatherConditionItemModel> constructTodayWeatherModels(
      List todayWeather) {
    return List.generate(
      todayWeather.length,
      (index) {
        final dateKey = todayWeather[index].keys.first;
        return WeatherConditionItemModel(
          dateTime: DateTime.parse(dateKey),
          icon: WeatherConditionItemModel.setWeatherIcon(
              todayWeather[index][dateKey]['weather']),
          temp: todayWeather[index][dateKey]['temp'],
        );
      },
    );
  }

  List<WeeklyConditionItemModel> constructWeeklyWeatherModels(
      List forecastedWeather) {
    return List.generate(
      forecastedWeather.length,
      (index) {
        final dateKey = forecastedWeather[index].keys.first;
        return WeeklyConditionItemModel(
          date: dateKey,
          highestTemp: forecastedWeather[index][dateKey]!.last.toDouble(),
          lowestTemp: forecastedWeather[index][dateKey]!.first.toDouble(),
        );
      },
    );
  }
}
