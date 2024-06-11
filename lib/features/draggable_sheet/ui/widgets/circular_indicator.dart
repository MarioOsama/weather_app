import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_colors.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({
    super.key,
    required this.parentWidth,
    required this.percentage,
  });

  final double parentWidth;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: parentWidth * percentage + 10,
      top: 0,
      bottom: 0,
      child: const CircleAvatar(
        radius: 10,
        backgroundColor: AppColors.whiteColor,
      ),
    );
  }
}
