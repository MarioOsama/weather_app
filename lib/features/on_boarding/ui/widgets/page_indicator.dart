import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_colors.dart';

class PageIndicator extends StatelessWidget {
  final bool isActive;
  const PageIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: isActive ? AppColors.blueBlackColor : AppColors.whiteColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(4),
      ),
      height: 8,
      width: isActive ? 20 : 8,
    );
  }
}
