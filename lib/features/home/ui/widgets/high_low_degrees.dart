import 'package:flutter/material.dart';
import 'package:weather_app/core/helpers/spacing.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';
import 'package:weather_app/features/home/ui/widgets/super_scripts_degree_rich_text.dart';

class HighLowDegrees extends StatelessWidget {
  const HighLowDegrees({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SuperScriptsDegreeRichText(
          text: 'H:24',
          style: AppTextStyles.font24WhiteSemiBold.copyWith(
            color: AppColors.blueBlackColor,
          ),
        ),
        horizontalSpace(20),
        SuperScriptsDegreeRichText(
          text: 'L:18',
          style: AppTextStyles.font24WhiteSemiBold.copyWith(
            color: AppColors.blueBlackColor,
          ),
        ),
      ],
    );
  }
}
