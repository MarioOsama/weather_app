import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/draggable_sheet/ui/widgets/sheet_header_action_button.dart';
import 'package:weather_app/features/home/logic/cubit/home_cubit.dart';
import 'package:weather_app/features/home/logic/cubit/home_state.dart';

class HourlyWeeklyButtonsRow extends StatelessWidget {
  const HourlyWeeklyButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, bool>(
      selector: (state) {
        if (state is HomeInitial) {
          return state.isHourlyForecast;
        }
        return true;
      },
      builder: (context, isHourlyForecast) {
        return Row(
          children: <Widget>[
            SheetHeaderActionButton(
              title: 'Hourly Forecast',
              isSelected: isHourlyForecast,
            ),
            const Spacer(),
            SheetHeaderActionButton(
              title: 'Weekly Forecast',
              isSelected: !isHourlyForecast,
            ),
          ],
        );
      },
    );
  }
}
