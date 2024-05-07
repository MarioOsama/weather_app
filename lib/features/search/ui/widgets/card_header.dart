import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/core/theming/app_assets.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({
    super.key,
    required this.temp,
  });

  final String temp;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$temp°',
          style: AppTextStyles.font64WhiteThin,
        ),
        const Spacer(),
        SvgPicture.asset(
          Assets.imagesSvgsMoonCloudMidRain,
          width: 120,
        ),
      ],
    );
  }
}
