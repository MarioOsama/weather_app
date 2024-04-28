import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_assets.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
    required this.isNight,
  });

  final bool isNight;

  @override
  Widget build(BuildContext context) {
    // Return home morning or night depending on the time of the day
    return _buildBackgroundImageDependsOnTime();
  }

  Image _buildBackgroundImageDependsOnTime() {
    if (isNight) {
      return Image.asset(Assets.imagesPngsHomeNightBg);
    }
    return Image.asset(Assets.imagesPngsHomeMorningBg);
  }
}
