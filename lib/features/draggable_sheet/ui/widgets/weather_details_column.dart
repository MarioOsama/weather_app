import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';
import 'package:weather_app/features/draggable_sheet/data/models/weather_details_item_model.dart';
import 'package:weather_app/features/draggable_sheet/ui/widgets/weather_details_item.dart';

class WeatherDetailsColumn extends StatelessWidget {
  const WeatherDetailsColumn({
    super.key,
  });

  static const List<WeatherDetailsItemModel> weatherDetailsModels = [
    WeatherDetailsItemModel(
      icon: Icons.ac_unit,
      title: 'Sunny',
      subtitle: '25°C',
      barPercentage: 0.7,
    ),
    WeatherDetailsItemModel(
      icon: Icons.wb_sunny,
      title: 'Sunny',
      subtitle: '25°C',
      barPercentage: 0.7,
      footerText: 'Humidity: 70%',
    ),
    WeatherDetailsItemModel(
      icon: Icons.wb_sunny,
      title: 'Sunny',
      subtitle: '25°C',
      // barPercentage: 0.7,
      footerText: 'Humidity: 70%',
    ),
    WeatherDetailsItemModel(
      icon: Icons.wb_sunny,
      title: 'Sunny',
      subtitle: '25°C',
      barPercentage: 0.7,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        WeatherDetailsItem(
          weatherDetailsItemModel: weatherDetailsModels[0],
          subtitleStyle: AppTextStyles.font20WhiteSemiBold,
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: weatherDetailsModels.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (context, index) => WeatherDetailsItem(
            weatherDetailsItemModel: weatherDetailsModels[index],
          ),
        ),
      ],
    );
  }
}
