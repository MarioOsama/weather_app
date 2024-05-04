import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_colors.dart';

class DraggableIndicator extends StatelessWidget {
  const DraggableIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 8,
      decoration: BoxDecoration(
        color: AppColors.blueBlackColor,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
