import 'package:flutter/material.dart';
import 'package:weather_app/features/home/ui/widgets/high_low_degrees.dart';

import 'current_city_degree_weather_condition.dart';

class InformationSummary extends StatelessWidget {
  const InformationSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        SizedBox(height: 100),
        CurrentCityDegreeWeatherCondition(),
        HighLowDegrees()
      ],
    );
  }
}
