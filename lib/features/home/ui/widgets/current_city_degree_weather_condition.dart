import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';
import 'package:weather_app/features/home/ui/widgets/super_scripts_degree_rich_text.dart';

class CurrentCityDegreeWeatherCondition extends StatelessWidget {
  const CurrentCityDegreeWeatherCondition({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Montreal',
          style: AppTextStyles.font34WhiteRegular.copyWith(
            color: color ?? AppColors.blueBlackColor,
          ),
        ),
        SuperScriptsDegreeRichText(
          text: '19',
          color: color,
        ),
        Text(
          'Sunny',
          style: AppTextStyles.font24WhiteSemiBold.copyWith(
            color: color ?? AppColors.blueBlackColor,
          ),
        ),
      ],
    );
  }
}
