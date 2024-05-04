import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';

class HourlyWeeklyButtonsRow extends StatelessWidget {
  const HourlyWeeklyButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          child: const Text(
            'Hourly Forecast',
            style: AppTextStyles.font16GreyMedium,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: const Text(
            'Weekly Forecast',
            style: AppTextStyles.font16GreyMedium,
          ),
        ),
      ],
    );
  }
}
