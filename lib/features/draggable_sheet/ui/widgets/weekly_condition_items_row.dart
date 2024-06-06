import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/draggable_sheet/data/models/weekly_condition_item_model.dart';
import 'package:weather_app/features/draggable_sheet/logic/cubit/sheet_cubit.dart';
import 'package:weather_app/features/draggable_sheet/ui/widgets/weekly_condition_item.dart';
import 'package:weather_app/features/home/logic/cubit/home_cubit.dart';
import 'package:weather_app/features/home/logic/cubit/home_state.dart';

class WeeklyConditionItemsRow extends StatelessWidget {
  const WeeklyConditionItemsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = context.read<HomeCubit>();
    final SheetCubit sheetCubit = context.read<SheetCubit>();

    final List weeklyForecast =
        (homeCubit.state as HomeLoaded).weeklyForecast.weatherList;

    final List<WeeklyConditionItemModel> weeklyWeatherModels =
        sheetCubit.constructWeeklyWeatherModels(weeklyForecast);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        weeklyWeatherModels.length,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: WeeklyConditionItem(
            weeklyConditionItemModel: weeklyWeatherModels[index],
          ),
        ),
      ),
    );
  }
}
