import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';

class CardFooter extends StatelessWidget {
  const CardFooter({
    super.key,
    required this.cityName,
    required this.weatherCondition,
  });

  final String cityName;
  final String weatherCondition;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          cityName,
          style: AppTextStyles.font20WhiteRegular,
        ),
        const Spacer(),
        Text(
          weatherCondition,
          style: AppTextStyles.font16WhiteRegular,
        ),
      ],
    );
  }
}
