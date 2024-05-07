import 'package:flutter/material.dart';
import 'package:weather_app/core/helpers/spacing.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';
import 'package:weather_app/features/home/ui/widgets/super_scripts_degree_rich_text.dart';

class HighLowDegrees extends StatelessWidget {
  const HighLowDegrees({
    super.key,
    this.color,
    required this.high,
    required this.low,
    this.fontSize,
    required this.center,
  });

  final String high;
  final String low;
  final double? fontSize;
  final Color? color;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          center ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: <Widget>[
        SuperScriptsDegreeRichText(
          text: 'H:$high',
          style: AppTextStyles.font24WhiteSemiBold.copyWith(
            color: color ?? AppColors.blueBlackColor,
            fontSize: fontSize ?? 24,
          ),
        ),
        horizontalSpace(20),
        SuperScriptsDegreeRichText(
          text: 'L:$low',
          style: AppTextStyles.font24WhiteSemiBold.copyWith(
            color: color ?? AppColors.blueBlackColor,
            fontSize: fontSize ?? 24,
          ),
        ),
      ],
    );
  }
}
