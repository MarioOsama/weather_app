import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';
import 'package:weather_app/features/draggable_sheet/data/models/weather_condition_item_model.dart';

class WeatherConditionItem extends StatelessWidget {
  const WeatherConditionItem({
    super.key,
    required this.weatherConditionItemModel,
  });

  final WeatherConditionItemModel weatherConditionItemModel;

  @override
  Widget build(BuildContext context) {
    final bool isNight = weatherConditionItemModel.dateTime.hour > 11 &&
        weatherConditionItemModel.dateTime.minute < 59;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      height: 150,
      width: 60,
      decoration: _buildDecoration(),
      child: Column(
        children: [
          FittedBox(
            child: Text(
              '${weatherConditionItemModel.dateTime.hour - 12} ${isNight ? 'PM' : 'AM'}',
              style: AppTextStyles.font15WhiteSemiBold,
            ),
          ),
          Expanded(
            child: Image.asset(weatherConditionItemModel.icon),
          ),
          Text(
            '${weatherConditionItemModel.temp.round()}°',
            style: AppTextStyles.font20WhiteRegular,
          ),
        ],
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      color: AppColors.secondaryColor.withOpacity(0.2),
      border: Border.all(
        color: AppColors.greyColor.withOpacity(0.25),
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.blueBlackColor.withOpacity(0.25),
          blurRadius: 15,
          spreadRadius: 3,
          offset: const Offset(1, 1),
        )
      ],
      borderRadius: BorderRadius.circular(30),
    );
  }
}
