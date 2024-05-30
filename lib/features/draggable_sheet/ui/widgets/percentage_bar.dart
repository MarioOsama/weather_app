import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/features/draggable_sheet/ui/widgets/circular_indicator.dart';

class PercentageBar extends StatelessWidget {
  const PercentageBar({
    super.key,
    required this.percentage,
    this.gradientColors,
  });

  final double percentage;
  final List<Color>? gradientColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: gradientColors ??
              [
                AppColors.blueColor,
                AppColors.pinkColor,
              ],
        ),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            CircularIndicator(
              parentWidth: constraints.maxWidth,
              percentage: percentage,
            ),
          ],
        );
      }),
    );
  }
}
