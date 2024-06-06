import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/draggable_sheet/ui/widgets/weather_condition_items_row.dart';
import 'package:weather_app/features/draggable_sheet/ui/widgets/weekly_condition_items_row.dart';
import 'package:weather_app/features/home/logic/cubit/home_cubit.dart';
import 'package:weather_app/features/home/logic/cubit/home_state.dart';

class WeatherConditionsHorizontalScrollView extends StatelessWidget {
  const WeatherConditionsHorizontalScrollView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, bool>(
      selector: (state) {
        return state.isHourlyForecast;
      },
      builder: (context, isHourlyForecast) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 15.0, top: 15.0),
            child: isHourlyForecast
                ? const WeatherConditionItemsRow()
                : const WeeklyConditionItemsRow(),
          ),
        );
      },
    );
  }
}
