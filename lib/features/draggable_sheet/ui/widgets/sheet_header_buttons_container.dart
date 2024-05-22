import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/features/draggable_sheet/ui/widgets/hourly_weekly_buttons_row.dart';

class SheetHeaderButtonsContainer extends StatelessWidget {
  const SheetHeaderButtonsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildDecoration(),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: HourlyWeeklyButtonsRow(),
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: AppColors.blueBlackColor.withOpacity(0.25),
          width: 1.25,
        ),
      ),
    );
  }
}
