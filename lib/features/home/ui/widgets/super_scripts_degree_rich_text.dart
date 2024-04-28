import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';

class SuperScriptsDegreeRichText extends StatelessWidget {
  const SuperScriptsDegreeRichText(
      {super.key,
      required this.text,
      this.style,
      this.superScriptText,
      this.color});

  final String text;
  final String? superScriptText;
  final TextStyle? style;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: text,
          style: style ??
              AppTextStyles.font96WhiteThin.copyWith(
                color: color ?? AppColors.blueBlackColor,
                height: 1,
              ),
        ),
        TextSpan(
          text: superScriptText ?? '°',
          style: style ??
              AppTextStyles.font96WhiteThin.copyWith(
                color: color ?? AppColors.blueBlackColor,
                fontFeatures: [
                  const FontFeature.superscripts(),
                ],
              ),
        ),
      ]),
    );
  }
}
