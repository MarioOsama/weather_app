import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_assets.dart';
import 'package:weather_app/features/draggable_sheet/data/models/weather_condition_item_model.dart';
import 'package:weather_app/features/draggable_sheet/ui/widgets/weather_condition_item.dart';

class WeatherConditionItemsRow extends StatelessWidget {
  const WeatherConditionItemsRow({
    super.key,
  });

  static List<WeatherConditionItemModel> weatherConditions = List.generate(
      8,
      (index) => WeatherConditionItemModel(
          time: DateTime.now().hour + index,
          icon: Assets.imagesSvgsMoonCloudMidRain,
          temp: Random(index).nextInt(30)));

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        weatherConditions.length,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: WeatherConditionItem(
            weatherConditionItemModel: weatherConditions[index],
          ),
        ),
      ),
    );
  }
}
