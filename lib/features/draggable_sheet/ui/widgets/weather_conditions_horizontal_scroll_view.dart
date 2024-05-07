import 'package:flutter/material.dart';
import 'package:weather_app/features/draggable_sheet/ui/widgets/weather_condition_items_row.dart';

class WeatherConditionsHorizontalScrollView extends StatelessWidget {
  const WeatherConditionsHorizontalScrollView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(left: 20.0, bottom: 15.0, top: 15.0),
        child: WeatherConditionItemsRow(),
      ),
    );
  }
}
