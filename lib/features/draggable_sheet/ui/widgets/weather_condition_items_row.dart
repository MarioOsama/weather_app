import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/draggable_sheet/data/models/weather_condition_item_model.dart';
import 'package:weather_app/features/draggable_sheet/logic/cubit/sheet_cubit.dart';
import 'package:weather_app/features/draggable_sheet/ui/widgets/weather_condition_item.dart';
import 'package:weather_app/features/home/logic/cubit/home_cubit.dart';
import 'package:weather_app/features/home/logic/cubit/home_state.dart';

class WeatherConditionItemsRow extends StatelessWidget {
  const WeatherConditionItemsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    final sheetCubit = context.read<SheetCubit>();

    final weatherConditionsList =
        (homeCubit.state as HomeLoaded).forecastWeather.weatherList;
    final List<Map<String, dynamic>> todayWeatherList =
        sheetCubit.getTodayWeatherConditions(weatherConditionsList);

    final List<WeatherConditionItemModel> todayWeatherModels =
        sheetCubit.constructTodayWeatherModels(todayWeatherList);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        todayWeatherModels.length,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: WeatherConditionItem(
            weatherConditionItemModel: todayWeatherModels[index],
          ),
        ),
      ),
    );
  }
}
