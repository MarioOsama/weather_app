import 'package:flutter/material.dart';
import 'package:weather_app/core/helpers/spacing.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/features/draggable_sheet/ui/widgets/draggable_indicator.dart';
import 'package:weather_app/features/draggable_sheet/ui/widgets/hourly_weekly_buttons_row.dart';

class SheetHeader extends StatelessWidget {
  const SheetHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DraggableIndicator(),
        verticalSpace(10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: HourlyWeeklyButtonsRow(),
        ),
        Divider(
          color: AppColors.blueBlackColor.withOpacity(0.5),
        ),
      ],
    );
  }
}
