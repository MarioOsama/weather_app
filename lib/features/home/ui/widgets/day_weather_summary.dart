import 'package:flutter/material.dart';
import 'package:weather_app/core/helpers/spacing.dart';
import 'package:weather_app/features/home/ui/widgets/high_low_degrees.dart';

import 'current_city_degree_weather_condition.dart';

class DayWeatherSummary extends StatelessWidget {
  const DayWeatherSummary({
    super.key,
    required this.isNight,
  });

  final bool isNight;

  @override
  Widget build(BuildContext context) {
    final Color? color = isNight ? Colors.white : null;
    return Column(
      children: <Widget>[
        verticalSpace(100),
        CurrentCityDegreeWeatherCondition(
          color: color,
        ),
        HighLowDegrees(
          color: color,
        )
      ],
    );
  }
}
