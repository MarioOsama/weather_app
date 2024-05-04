import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/features/draggable_sheet/ui/widgets/action_buttons_row.dart';
import 'package:weather_app/features/draggable_sheet/ui/widgets/curved_clipper.dart';

class ActionButtonsContainer extends StatelessWidget {
  const ActionButtonsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedClipper(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.primaryGradientColorOne.withOpacity(0.25),
        ),
        child: const ActionButtonsRow(),
      ),
    );
  }
}
